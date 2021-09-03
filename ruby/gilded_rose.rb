class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      DailyUpdateStrategy.for(item).do_daily_update
    end
  end
end

class DailyUpdateStrategy

  class Sulfuras < DailyUpdateStrategy
    def update_quality
      item.quality = 80
    end

    def update_sell_in
    end
  end

  class Brie < DailyUpdateStrategy
    def update_quality
      increment_quality
      increment_quality if item.sell_in <= 0
    end
  end

  class BackstagePass < DailyUpdateStrategy
    def update_quality
      increment_quality
      increment_quality if item.sell_in < 11
      increment_quality if item.sell_in < 6
      item.quality = 0 if item.sell_in <= 0
    end
  end

  def self.for(item)
    case item.name
    when "Sulfuras, Hand of Ragnaros" then Sulfuras
    when "Aged Brie" then Brie
    when "Backstage passes to a TAFKAL80ETC concert" then BackstagePass
    else self
    end.new(item)
  end

  def initialize(item)
    @item = item
  end

  def do_daily_update
    update_quality
    update_sell_in
  end

  def update_quality
    decrement_quality
    decrement_quality if item.sell_in <= 0
  end

  def update_sell_in
    decrement_sell_in
  end

  private

  attr_reader :item

  def decrement_sell_in
    item.sell_in -= 1
  end

  def increment_quality
    if item.quality < 50
      item.quality += 1
    end
  end

  def decrement_quality
    if item.quality > 0
      item.quality -= 1
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
end
