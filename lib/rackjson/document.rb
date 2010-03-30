module Rack::JSON
  class Document

    def initialize(doc)
      if doc.is_a? String
        @document = Rack::JSON::JSONDocument.new(doc)
      else # TODO, check for the right kind of mongo doc
        @document = Rack::JSON::MongoDocument.new(doc)
      end
    end

    def add_id(id_object)
      @document.add_id(id_object)
    end

    def attributes
      @document.attributes
    end

    def content_length
      to_json.length.to_s
    end

    def to_json
      unless @json
        gen_attrs = @document.attributes
        gen_attrs.each_pair do |key, value|
          if value.is_a? Time
            gen_attrs[key] = "Date(#{value.to_i * 1000})"
          end

          if value.is_a? Mongo::ObjectID
            gen_attrs[key] = gen_attrs[key].to_s
          end
        end
      end
      @json ||= JSON.generate gen_attrs
    end
  end
end