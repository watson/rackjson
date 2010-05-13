# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rackjson}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Oliver Nightingale"]
  s.date = %q{2010-05-12}
  s.description = %q{A rack end point for storing json documents.}
  s.email = %q{oliver.n@new-bamboo.co.uk}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "lib/rackjson.rb",
     "lib/rackjson/base_document.rb",
     "lib/rackjson/collection.rb",
     "lib/rackjson/document.rb",
     "lib/rackjson/end_point.rb",
     "lib/rackjson/filter.rb",
     "lib/rackjson/json_document.rb",
     "lib/rackjson/json_query.rb",
     "lib/rackjson/mongo_document.rb",
     "lib/rackjson/rack/builder.rb",
     "lib/rackjson/request.rb",
     "lib/rackjson/resource.rb",
     "lib/rackjson/response.rb",
     "rackjson.gemspec",
     "test/helper.rb",
     "test/suite.rb",
     "test/test_collection.rb",
     "test/test_document.rb",
     "test/test_filter.rb",
     "test/test_json_document.rb",
     "test/test_json_query.rb",
     "test/test_mongo_document.rb",
     "test/test_rack_builder.rb",
     "test/test_resource.rb",
     "test/test_response.rb"
  ]
  s.homepage = %q{http://github.com/olivernn/rackjson}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A rack end point for storing json documents.}
  s.test_files = [
    "test/helper.rb",
     "test/suite.rb",
     "test/test_collection.rb",
     "test/test_document.rb",
     "test/test_filter.rb",
     "test/test_json_document.rb",
     "test/test_json_query.rb",
     "test/test_mongo_document.rb",
     "test/test_rack_builder.rb",
     "test/test_resource.rb",
     "test/test_response.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongo>, [">= 0.19.1"])
      s.add_runtime_dependency(%q<mongo_ext>, [">= 0.19.1"])
      s.add_runtime_dependency(%q<json>, [">= 1.2.3"])
      s.add_runtime_dependency(%q<rack>, [">= 1.0.1"])
    else
      s.add_dependency(%q<mongo>, [">= 0.19.1"])
      s.add_dependency(%q<mongo_ext>, [">= 0.19.1"])
      s.add_dependency(%q<json>, [">= 1.2.3"])
      s.add_dependency(%q<rack>, [">= 1.0.1"])
    end
  else
    s.add_dependency(%q<mongo>, [">= 0.19.1"])
    s.add_dependency(%q<mongo_ext>, [">= 0.19.1"])
    s.add_dependency(%q<json>, [">= 1.2.3"])
    s.add_dependency(%q<rack>, [">= 1.0.1"])
  end
end

