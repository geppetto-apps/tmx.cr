module Tmx
  class ImageLayer
    JSON.mapping(
      properties: {
        height:  Int16,
        image:   String,
        name:    String,
        opacity: Float32,
        type:    String,
        visible: Bool,
        width:   Int16,
        x:       Int16,
        y:       Int16,
      }
    )
  end
end
