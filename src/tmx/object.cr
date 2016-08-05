module Tmx
  class Object
    JSON.mapping(
      properties: {
        name:   String,
        points: {
          type:    Array(String),
          nilable: true,
        },
        shape: {
          type:    String,
          nilable: true,
        },
        properties: Hash(String, String),
        visible:    Bool,
        height:     Int16,
        width:      Int16,
        y:          Int16,
        x:          Int16,
        type:       String,
        ellipse:    {
          type:    Bool,
          nilable: true,
        },
      }
    )

    def shape
      previous_def || "polygon"
    end

    def points
      previous_def || rectangle_points
    end

    private def rectangle_points
      [
        "#{@x},#{@y}",
        "#{@x + @width},#{@y}",
        "#{@x + @width},#{@y + @height}",
        "#{@x},#{@y + @height}",
      ]
    end
  end
end
