module Rack::JSON
  class Resource
    METHODS_NOT_ALLOWED = [:trace, :connect]

    def initialize(app, options)
      @app = app
      @collections = options[:collections]
      @db = options[:db]
    end

    def call(env)
      request = Rack::JSON::Request.new(env)
      if bypass? request
        @app.call(env)
      else
        @collection = Rack::JSON::Collection.new(@db[request.collection])
        send(request.request_method.downcase, request)
      end
    end

    private

    def bypass?(request)
      request.collection.empty? || !(@collections.include? request.collection.to_sym)
    end

    def delete(request)
      if request.member_path?
        if @collection.delete({:_id => request.resource_id})
          render "{'ok': true}"
        end
      else
        render "", :status => 405
      end
    end

    [:get, :head].each do |method|
      define_method method do |request|
        request.query.selector.merge!({:_id => request.resource_id}) if request.member_path?
        documents = @collection.find(request.query.selector, request.query.options)
        if documents.empty? && request.member_path?
          render "document not found", :status => 404, :head => (method == :head)
        else
          render JSON.generate(documents), :head => (method == :head)
        end
      end
    end

    def options(request)
      if request.collection_path?
        headers = { "Allow" => "GET, POST" }
      elsif request.member_path?
        headers = { "Allow" => "GET, PUT, DELETE" }
      end
      render "", :headers => headers
    end

    def post(request)
      document = Rack::JSON::Document.new(request.json)
      @collection.create(document.attributes)
      render document.to_json, :status => 201
    rescue JSON::ParserError => error
      render (error.class.to_s + " :" + error.message), :status => 422
    end

    def put(request)
      @collection.exists?(request.resource_id) ? update(request) : upsert(request)
    rescue JSON::ParserError => error
      render (error.class.to_s + " :" + error.message), :status => 422
    end

    def render(body, options={})
      Rack::JSON::Response.new(body, options).to_a
    end

    def update(request)
      document = Rack::JSON::Document.new(request.json)
      document.add_id(request.resource_id)
      if @collection.update(request.resource_id, document.attributes, request.query.selector)
        render document.to_json, :status => 200
      else
        render "document not found", :status => 404
      end
    end

    def upsert(request)
      document = Rack::JSON::Document.new(request.json)
      document.add_id(request.resource_id)
      @collection.save(document.attributes)
      render document.to_json, :status => 201
    end

    METHODS_NOT_ALLOWED.each do |method|
      define_method method do |request|
        render "", :status => 405
      end
    end
  end
end