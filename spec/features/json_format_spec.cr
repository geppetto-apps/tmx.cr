require "../spec_helper"

Spec2.describe Tmx do
  let(fixture_file) do
    File.join File.dirname(__FILE__), "..", "fixtures", "map.json"
  end

  let(map) do
    described_class.load(fixture_file)
  end

  subject { map }

  it "has a version" do
    expect(subject.version).to eq 1
  end

  it "has a height" do
    expect(subject.height).to eq 12
  end
  it "has a width" do
    expect(subject.width).to eq 16
  end

  it "has a tileheight" do
    expect(subject.tileheight).to eq 32
  end
  it "has a tilewidth" do
    expect(subject.tilewidth).to eq 32
  end

  it "has a orientation" do
    expect(subject.orientation).to eq "orthogonal"
  end

  describe "#properties" do
    it "has the correct number of properties" do
      expect(subject.properties.size).to eq(1)
    end

    it "property values are correct" do
      expect(subject.properties["hero.position"]).to eq "400,525,1"
    end
  end

  describe "#layers" do
    it "has the correct number of layers" do
      expect(subject.layers.size).to eq 3
    end

    context "when evaluating the first tile layer" do
      let(layer) { map.tile_layers.first }

      it "should have a name" do
        expect(layer.name).to eq "Layer"
      end
      it "should have a opacity" do
        expect(layer.opacity).to eq 1
      end
      it "should have a type" do
        expect(layer.type).to eq "tilelayer"
      end
      it "should have a visible" do
        expect(layer.visible).to eq true
      end
      it "should have a height" do
        expect(layer.height).to eq 12
      end
      it "should have a width" do
        expect(layer.width).to eq 16
      end
      it "should have a x" do
        expect(layer.x).to eq 0
      end
      it "should have a y" do
        expect(layer.y).to eq 0
      end

      it "should have data" do
        expect(layer.data).to eq [
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          0, 141, 142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          0, 0, 0, 0, 0, 0, 0, 141, 142, 20, 0, 0, 0, 141, 142, 0,
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          28, 29, 30, 0, 0, 0, 0, 0, 25, 26, 27, 0, 0, 0, 0, 0,
          46, 47, 48, 0, 0, 0, 0, 0, 43, 44, 45, 0, 0, 0, 0, 0,
          0, 65, 0, 0, 8, 8, 8, 23, 0, 80, 0, 137, 138, 0, 0, 0, 0,
          83, 0, 0, 0, 0, 50, 0, 0, 80, 0, 191, 192, 0, 1, 1, 1, 1,
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 37, 37, 37, 37, 37, 37,
          37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37,
          37, 37, 37, 37, 37, 37, 19, 37, 38, 37, 37, 37, 38, 37, 37,
          37, 37, 37, 19, 37, 37, 37, 37, 37, 37, 37, 37,
        ]
      end
    end
  end

  describe "#tilesets" do
    it "has the correct number of tilesets" do
      expect(subject.tilesets.size).to eq 1
    end

    context "when evaluating the first tileset" do
      let(tileset) { map.tilesets.first }

      it "should have firstgid" do
        expect(tileset.firstgid).to eq 1
      end
      it "should have image" do
        expect(tileset.image).to eq "tiles.png"
      end
      it "should have imageheight" do
        expect(tileset.imageheight).to eq 400
      end
      it "should have imagewidth" do
        expect(tileset.imagewidth).to eq 640
      end
      it "should have margin" do
        expect(tileset.margin).to eq 2
      end
      it "should have name" do
        expect(tileset.name).to eq "tiles"
      end
      it "should have spacing" do
        expect(tileset.spacing).to eq 2
      end
      it "should have tileheight" do
        expect(tileset.tileheight).to eq 32
      end
      it "should have tilewidth" do
        expect(tileset.tilewidth).to eq 32
      end
      it "should have properties" do
        expect(tileset.properties).to eq({"alpha" => "1"})
      end
    end
  end

  describe "#object_groups" do
    it "has the correct number of object groups" do
      expect(subject.object_groups.size).to eq 1
    end

    context "when evaluating the first object group" do
      let(object_group) { map.object_groups.first }

      it "should have name" do
        expect(object_group.name).to eq "Objects"
      end

      it "should have width" do
        expect(object_group.width).to eq 16
      end

      it "should have height" do
        expect(object_group.height).to eq 12
      end

      it "should have objects" do
        expect(object_group.objects.size).to eq 6
      end

      it "should have opacity" do
        expect(object_group.opacity).to eq 1
      end

      context "when evaluating a rectangluar object" do
        let(object) { map.object_groups.first.objects.first }

        it "should have name" do
          expect(object.name).to eq "ground"
        end

        it "should have type" do
          expect(object.type).to eq "floor"
        end

        it "should have x" do
          expect(object.x).to eq 0
        end

        it "should have y" do
          expect(object.y).to eq 256
        end

        it "should have width" do
          expect(object.width).to eq 512
        end

        it "should have height" do
          expect(object.height).to eq 32
        end

        it "should have visible" do
          expect(object.visible).to eq true
        end

        it "should have shape" do
          expect(object.shape).to eq "polygon"
        end

        it "should have points" do
          expect(object.points).to eq ["0,256", "512,256", "512,288", "0,288"]
        end

        it "should have properties" do
          expect(object.properties.size).to eq 1
        end

        it "has the correct properties" do
          expect(object.properties["type"]).to eq "sand"
        end
      end

      context "when evaluating a circular object" do
        let(object) { map.object_groups.first.objects[2] }

        it "should have name" do
          expect(object.name).to eq "mushroom"
        end

        it "should have type" do
          expect(object.type).to eq "mushroom"
        end

        it "should have x" do
          expect(object.x).to eq 256
        end

        it "should have y" do
          expect(object.y).to eq 224
        end

        it "should have width" do
          expect(object.width).to eq 32
        end

        it "should have height" do
          expect(object.height).to eq 32
        end

        it "should have visible" do
          expect(object.visible).to eq true
        end

        it "should have properties" do
          expect(object.properties.size).to eq 1
        end

        it "should have shape" do
          expect(object.shape).to eq "ellipse"
        end

        it "has the correct properties" do
          expect(object.properties["player.life.bonus"]).to eq "1"
        end
      end

      context "when evaluating a polygon (triangle)" do
        let(object) { map.object_groups.first.objects[3] }

        it "should have name" do
          expect(object.name).to eq "danger"
        end

        it "should have type" do
          expect(object.type).to eq "sign"
        end

        it "should have x" do
          expect(object.x).to eq 448
        end

        it "should have y" do
          expect(object.y).to eq 192
        end

        it "should have shape" do
          expect(object.shape).to eq "polygon"
        end

        it "should have points" do
          expect(object.points).to eq ["0,0", "32,64", "-32,64", "0,0"]
        end

        it "should have visible" do
          expect(object.visible).to eq true
        end

        it "should have (empty) properties" do
          expect(object.properties.size).to eq 0
        end
      end

      context "when evaluating a polyline (line segments)" do
        let(object) { map.object_groups.first.objects[4] }

        it "should have name" do
          expect(object.name).to eq "dirt"
        end

        it "should have type" do
          expect(object.type).to eq "underground"
        end

        it "should have x" do
          expect(object.x).to eq 32
        end

        it "should have y" do
          expect(object.y).to eq 320
        end

        it "should have visible" do
          expect(object.visible).to eq true
        end

        it "should have properties" do
          expect(object.properties.size).to eq 3
        end

        it "should have shape" do
          expect(object.shape).to eq "polyline"
        end

        it "should have points" do
          expect(object.points).to eq ["0,0", "448,0", "448,64", "0,64", "0,0"]
        end
      end
    end
  end

  describe "#image_layers" do
    it "has the correct number of image layers" do
      expect(subject.image_layers.size).to eq 1
    end

    context "when evaluating the first image layer" do
      let(image_layer) { map.image_layers.first }

      it "should have name" do
        expect(image_layer.name).to eq "Image Layer"
      end
      it "should have width" do
        expect(image_layer.width).to eq 16
      end
      it "should have height" do
        expect(image_layer.height).to eq 12
      end
    end
  end
end
