class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Sulfuras, Hand of Ragnaros"
        return
      when "Aged Brie"
        item.increment_quality
        item.sell_in = item.sell_in - 1
        if item.sell_in < 0
          item.increment_quality
        end
      when "Backstage passes to a TAFKAL80ETC concert"
        item.increment_quality
        if item.sell_in < 11
          item.increment_quality
        end
        if item.sell_in < 6
          item.increment_quality
        end
        item.sell_in = item.sell_in - 1
        item.quality = 0 if item.sell_in < 0
      else
        item.decrement_quality
        item.sell_in = item.sell_in - 1
        if item.sell_in < 0
          item.decrement_quality
        end
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def increment_quality
    if quality < 50
      self.quality += 1
    end
  end

  def decrement_quality
    if quality > 0
      self.quality -= 1
    end
  end
end
