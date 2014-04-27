require "nokogiri"
require "officedoc/package/raw/ruby_zip_engine"

module Officedoc
  class Package
    class Raw
      class Part
        attr_reader :name
        attr_reader :type
        
        def initialize(zip_file,xml_node)
          @name = xml_node["PartName"]
          @type = xml_node["ContentType"]
          @zip_file = zip_file
        end
        private def file_name
          name[1..-1]
        end
        
        def read_stream(&block)
          @zip_file.entry_read_stream(file_name,&block)
        end
      end
    end
  end
end

module Officedoc
  class Package
    class Raw
      class PartList < SimpleDelegator
        EntryName = '[Content_Types].xml'
        
        def initialize(zip_file)
          __setobj__([])
          @zip_file = zip_file
          read_from zip_file if zip_file
          yield self if block_given?
        end
        
        def read_from(zip_file)
          zip_file.entry_read_stream( EntryName ) do |stream| 
            doc = Nokogiri::XML(stream)
            doc.css("Override[@PartName]").each do |node|
              push Officedoc::Package::Raw::Part.new @zip_file, node
            end
          end
        end
        
        def of_type( type, regexp: false, partial: false )
          select do |part| 
            if regexp 
              part.type.match(type)
            elsif partial
              part.type.include?(type)
            else
              part.type == type
            end
          end
        end

      end
    end
  end
end