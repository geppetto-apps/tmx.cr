require "json"
require "./tmx/*"

module Tmx
  def self.load(path)
    Tmx::Map.from_json(File.read(path))
  end
end
