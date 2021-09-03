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
      item.increment_quality
      item.increment_quality if item.sell_in <= 0
    end
  end

  class BackstagePass < DailyUpdateStrategy
    def update_quality
      item.increment_quality
      item.increment_quality if item.sell_in < 11
      item.increment_quality if item.sell_in < 6
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
    item.decrement_quality
    item.decrement_quality if item.sell_in <= 0
  end

  def update_sell_in
    item.decrement_sell_in
  end

  private

  attr_reader :item
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

  def decrement_sell_in
    self.sell_in -= 1
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
