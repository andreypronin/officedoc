module Officedoc
  class Package
    class Raw
      attr_reader :stream
      def initialize( stream )
        @stream = stream || null
      end
    end
  end
end