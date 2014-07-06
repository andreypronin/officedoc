module Officedoc
  module Source
    class NullZip
      def initialize
      end
      def entries
        []
      end
      def entry(name)
        ""
      end
    end
  end
end