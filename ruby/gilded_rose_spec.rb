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

    context "for a non-special item" do
      let(:name) { "not-a-special-case" }

      it "decrements the sell-in date" do
        expect(item.sell_in).to eq 4
      end

      it "decrements the quality" do
        expect(item.quality).to eq 9
      end
    end
  end
end
