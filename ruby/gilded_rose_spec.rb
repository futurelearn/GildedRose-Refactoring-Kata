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

      context "when the sell-in date has passed" do
        let(:sell_in) { 0 }

        it "decrements the quality twice" do
          expect(item.quality).to eq 8
        end
      end

      context "when the quality is zero" do
        let(:quality) { 0 }

        it "does not decrement the quality" do
          expect(item.quality).to eq 0
        end
      end
    end

    context "for Aged brie" do
      let(:name) { "Aged Brie" }

      it "increments the quality" do
        expect(item.quality).to eq 11
      end

      it "decrements the sell-in date" do
        expect(item.sell_in).to eq 4
      end

      context "when the quality is 50 or more" do
        let(:quality) { 50 }

        it "does not increment the quality" do
          expect(item.quality).to eq 50
        end
      end
    end
  end
end
