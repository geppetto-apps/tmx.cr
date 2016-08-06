module Tmx
  struct TileLayer
    JSON.mapping(
      properties: {
        name:    String,
        y:       Int16,
        x:       Int16,
        width:   Int16,
        height:  Int16,
        visible: Bool,
        type:    String,
        opacity: Float32,
        data:    Array(Int32),
      }
    )
  end
end
