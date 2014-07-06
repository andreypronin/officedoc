require "officedoc/version"
require "officedoc/part"
require "officedoc/doc"
require "officedoc/source"

module Officedoc
  def open(source)
    Officedoc::Doc.new(source)
  end
end
