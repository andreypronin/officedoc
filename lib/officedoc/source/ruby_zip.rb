require "zip" # RubyZip

module Officedoc
  module Source
    class RubyZip
      def initialize(filename)
        @filename = filename
        @zip_file = Zip::File.open(filename)
      end
      def zip_entries
        unless @zip_entries
          @zip_entries = {}
          @zip_file.each { |ent| @zip_entries[ent.name] = ent }
        end
        @zip_entries
      end
      def entries
        # @zip_file.each.map(&:name)
        zip_entries.keys
      end
      def entry(name)
        ent = zip_entries[name]
        ent.get_input_stream if ent
      end
    end
  end
end