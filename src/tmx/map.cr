module Tmx
  class Map
    getter :properties
    getter :version
    getter :orientation
    getter :tilewidth
    getter :tileheight
    getter :width
    getter :height
    getter :layers
    setter :layers

    JSON.mapping(
      properties: {
        properties:  Hash(String, String),
        version:     Int16,
        orientation: String,
        tilewidth:   Int16,
        tileheight:  Int16,
        width:       Int16,
        height:      Int16,
        layers:      Array(TileLayer | ObjectLayer | ImageLayer),
        tilesets:    Array(Tmx::Tileset),
      }
    )

    def tile_layers
      layers.select do |layer|
        layer.type == "tilelayer"
      end.map do |layer|
        layer.as(TileLayer)
      end
    end

    def image_layers
      layers.select do |layer|
        layer.is_a? ImageLayer
      end
    end

    def object_groups
      layers.select do |layer|
        layer.type == "objectgroup"
      end.map do |layer|
        layer.as(ObjectLayer)
      end
    end
  end
end
