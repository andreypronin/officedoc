require "officedoc/package/raw/ruby_zip_engine"
require "officedoc/package/raw/parts"

module Officedoc
  class Package
    class Raw
      attr_reader :zip_engine
      attr_reader :stream
      
      def initialize( stream, zip_engine: ::Officedoc::Package::Raw::RubyZipEngine )
        @zip_engine = zip_engine
        @stream = stream
      end
      private def zip_file
        @zip_file ||= zip_engine.new(stream)
      end

      def file_names
        zip_file.entries.map(&:name)
      end
      def parts
        @parts ||= PartList.new zip_file
      end
      def document_type
        @document_type ||= get_document_type
      end
      private def get_document_type
        # Example: "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"
        main_doc_parts = parts.of_type "document.main+xml", partial: true
        return "" if main_doc_parts.size != 1
      
        match = /.*\.(.*)\.document\.main\+xml/.match(main_doc_parts[0].type)
        match ? match[1] : ""
      end
    end
  end
end