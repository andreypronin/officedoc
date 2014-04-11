require "officedoc/package/raw/ruby_zip_engine"

module Officedoc
  class Package
    class Raw
      attr_reader :stream
      attr_reader :zip_engine
      
      def initialize( stream, zip_engine: ::Officedoc::Package::Raw::RubyZipEngine )
        @stream = stream || null
        @zip_engine = zip_engine
      end
      def files
        entries.map(&:name)
      end
      
      private def zip_file
        @zip_file ||= zip_engine.use_stream(stream)
      end
      private def entries
        @entries ||= get_entries
      end
      private def get_entries
        entries = []
        zip_file.each { |entry| entries << entry }
        entries
      end
    end
  end
end