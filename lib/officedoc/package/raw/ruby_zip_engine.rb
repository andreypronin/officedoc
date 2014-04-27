# Engine for RubyZip gem
require "zip"

module Officedoc
  class Package
    class Raw
      class RubyZipEngine
        def initialize(stream)
          @f = ::Zip::File.new(stream, true, true)
          @f.read_from_stream(stream)
        end
        
        def entries
          @entries ||= get_entries
        end
        def entry(name)
          @entries_by_name ||= {}
          @entries_by_name.fetch(name) { get_entry(name) }
        end
        def entry_read_stream(name,&block)
          entry(name).get_input_stream(&block)
        end

        private def get_entries
          entries = []
          @f.each { |entry| entries << entry }
          entries
        end
        private def get_entry(name)
          entries.find { |entry| entry.name == name } || Officedoc.null
        end
      end
    end
  end
end

