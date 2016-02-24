class GildedRose
  attr_reader :name, :quality, :days_remaining

  def initialize(name, quality, days_remaining)
    @name, @quality, @days_remaining = name, quality, days_remaining
  end

  def tick
    if @name == 'normal'
      normal
    elsif @name == 'Aged Brie'
      brie
    elsif @name == 'Backstage passes to a TAFKAL80ETC concert'
      backstage
    end
  end

  def normal
    @quality -= 1 if @quality > 0
    @quality -= 1 if @days_remaining <= 0
    @days_remaining -= 1
  end

  def brie
    @quality += 1 if @quality < 50
    @quality += 1 if @days_remaining <= 0
    @days_remaining -= 1
  end

  def backstage
    if @quality != 50
      @quality += 3 if @days_remaining <= 5
      @quality += 1 if @days_remaining > 10
      @quality += 2 if @days_remaining <= 10 && @days_remaining > 5
    end
    @quality = 0 if @days_remaining <= 0
    @days_remaining -= 1
  end
end
