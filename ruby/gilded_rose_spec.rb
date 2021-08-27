require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "reduces the sell in date of the item if it is not Sulfuras" do
      items = [Item.new("foo", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end

    it "reduces the sell in date to a negative number if it is zero" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
    end

    it "does not reduce the sell in date for Sulturas" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end
  end

end
