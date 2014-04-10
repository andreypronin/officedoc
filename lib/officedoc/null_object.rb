require "naught"

module Officedoc
  private 
    NullObject = Naught.build do |config|
      config.black_hole
      config.traceable
    end
    def self.null
      NullObject.get
    end
end
