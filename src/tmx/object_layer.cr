require "./object"

module Tmx
  struct ObjectLayer
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
        objects: Array(Tmx::Object),
      }
    )
  end
end
