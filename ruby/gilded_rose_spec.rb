require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    describe "quality behaviour" do
      it "decreases in quality" do
        items = [Item.new("foo", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 9
      end

      it "decreases faster after sell-by date" do
        items = [Item.new("foo", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 8
      end

      it "does not have negative quality" do
        items = [Item.new("foo", 5, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end

      it "is never higher than 50" do
        items = [Item.new("foo", 10, 60)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end
    end

    describe "sell-in behaviour" do
      it "decreases sell-in date" do
        items = [Item.new("foo", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
      end
    end
  end

end
