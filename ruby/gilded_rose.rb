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
    def do_daily_update
    end
  end

  class Brie < DailyUpdateStrategy
    def do_daily_update
      item.increment_quality
      item.increment_quality if item.sell_in <= 0
      item.decrement_sell_in
    end
  end

  class BackstagePass < DailyUpdateStrategy
    def do_daily_update
      item.increment_quality
      item.increment_quality if item.sell_in < 11
      item.increment_quality if item.sell_in < 6
      item.quality = 0 if item.sell_in <= 0
      item.decrement_sell_in
    end
  end

  class UnknownItem < DailyUpdateStrategy
    def do_daily_update
      item.decrement_quality
      item.decrement_quality if item.sell_in <= 0
      item.decrement_sell_in
    end
  end

  def self.for(item)
    case item.name
    when "Sulfuras, Hand of Ragnaros" then Sulfuras
    when "Aged Brie" then Brie
    when "Backstage passes to a TAFKAL80ETC concert" then BackstagePass
    else UnknownItem
    end.new(item)
  end

  def initialize(item)
    @item = item
  end

  def do_daily_update
    fail NotImplementedError
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
