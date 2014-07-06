require "officedoc/part"

module Officedoc
  class Doc
    attr_reader :source
    def initialize(source)
      @source = source
    end
    def parts
      @parts ||= Officedoc::PartsList.new(@source)
    end
    def part_rels
      parts["_rels/.rels"]
    end
    def part_doc
      r = part_rels.relations("http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument").first
      parts[ r["Target"] ]
    end
  end
end
