require "officedoc/version"
require "officedoc/null_object"
require "officedoc/package"

module Officedoc
  def self.open(*args)
    Officedoc::Package.new(*args)
  end
end
