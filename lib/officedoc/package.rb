require "officedoc/package/raw"

module Officedoc
  class Package
    include NullObject::Conversions
    attr_accessor :filename
    attr_reader :raw
    def initialize( filename: Officedoc.null, stream: Officedoc.null )
      @filename = filename
      unless Actual(stream)
        stream = open( filename, "rb" ) if Actual(filename)
      end
      @raw = Raw.new( stream )
    end
  end
end