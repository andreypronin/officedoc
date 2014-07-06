require "nokogiri"
require "delegate"

module Officedoc
  class Part
    attr_reader :name
    def initialize(list,name)
      @list = list
      @name = name
    end
    def source
      @list.source
    end
    def xml
      @xml ||= Nokogiri::XML( source.entry(name) )
    end
    private def relations(with_type = nil)
      query = xml.namespaces["xmlns"] ? "//xmlns:Relationships/xmlns:Relationship" : "//Relationships/Relationship"
      query = query + "[@Type='#{with_type}']" if with_type
      xml.xpath query
    end
    def related_parts(with_type = nil)
      relations(with_type).map do |entry|
        rel_name = entry["Target"]
        { type: entry["Type"], name: rel_name, part: list[rel_name], id: entry["Id"] }
      end
    end
  end
end

module Officedoc
  class NullPart < Part
    def initialize
    end
    def xml
      @xml ||= Nokogiri::XML( "" )
    end
  end
end

module Officedoc
  class PartsList < SimpleDelegator
    def initialize(source)
      super({})
      source.entries.each do |name|
        self[name] = Officedoc::Part.new(self,name)
      end
    end
    def [](name)
      super(name) || NullPart.new
    end
  end
end