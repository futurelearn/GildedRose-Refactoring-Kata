require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  let(:name) { "foo" }
  let(:sell_in) { 5 }
  let(:quality) { 10 }
  let(:item) { Item.new(name, sell_in, quality) }

  subject { described_class.new([item]) }

  before { subject.update_quality }

  describe "#update_quality" do
    it "does not change the name" do
      expect(item.name).to eq "foo"
    end
  end
end
