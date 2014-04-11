# Engine for RubyZip gem
require "zip"

module Officedoc
  class Package
    class Raw
      class RubyZipEngine
        def self.use_stream(stream)
          f = ::Zip::File.new(stream, true, true)
          f.read_from_stream(stream)
          f
        end
      end
    end
  end
end
