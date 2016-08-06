module Tmx
  struct Object
    JSON.mapping(
      properties: {
        name:    String,
        polygon: {
          type:    Array(Coordinate),
          nilable: true,
        },
        polyline: {
          type:    Array(Coordinate),
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
      return "ellipse" if ellipse
      return "polyline" if polyline
      "polygon"
    end

    def points
      (polygon || polyline || rectangle_points).map do |coord|
        "#{coord.x},#{coord.y}"
      end
    end

    private def rectangle_points
      [
        Coordinate.new(@x, @y),
        Coordinate.new(@x + @width, @y),
        Coordinate.new(@x + @width, @y + @height),
        Coordinate.new(@x, @y + @height),
      ]
    end

    struct Coordinate
      JSON.mapping(
        x: Int16,
        y: Int16
      )

      def initialize(@x, @y)
      end
    end
  end
end
