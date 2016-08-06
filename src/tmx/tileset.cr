module Tmx
  struct Tileset
    JSON.mapping(
      properties: {
        properties:  Hash(String, String),
        firstgid:    Int16,
        tilewidth:   Int16,
        tileheight:  Int16,
        spacing:     Int16,
        name:        String,
        margin:      Int16,
        imagewidth:  Int16,
        imageheight: Int16,
        image:       String,
      }
    )
  end
end
