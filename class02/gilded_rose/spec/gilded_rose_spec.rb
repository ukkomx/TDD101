require 'spec_helper'
require 'gilded_rose'

describe GildedRose do

  describe '#tick' do
    context "with a normal object" do

      it 'before sell date' do
        item =  GildedRose.new('normal', 10, 5)
        item.tick

        expect(item.quality).to eql 9
        expect(item.days_remaining).to eql 4
      end

      it 'on sell date' do
        item =  GildedRose.new('normal', 10, 0)
        item.tick

        expect(item.quality).to eql 8
        expect(item.days_remaining).to eql -1
      end

      it 'after sell date' do
        item =  GildedRose.new('normal', 10, -10)
        item.tick

        expect(item.quality).to eql 8
        expect(item.days_remaining).to eql -11
      end

      it 'on zero quality' do
        item =  GildedRose.new('normal', 0, 5)
        item.tick

        expect(item.quality).to eql 0
        expect(item.days_remaining).to eql 4
      end
    end

    context 'with a brie object' do

      context 'before sell' do
        it 'brie item with normal quality' do
          item =  GildedRose.new('Aged Brie', 10, 5)
          item.tick

          expect(item.quality).to eql 11
          expect(item.days_remaining).to eql 4
        end

        it 'brie item with max quality' do
          item =  GildedRose.new('Aged Brie', 50, 5)
          item.tick

          expect(item.quality).to eql 50
          expect(item.days_remaining).to eql 4
        end
      end

      context 'on sell date' do
        it 'brie item with normal quality' do
          item =  GildedRose.new('Aged Brie', 10, 0)
          item.tick

          expect(item.quality).to eql 12
          expect(item.days_remaining).to eql -1
        end

        it 'brie item near max quality' do
          item =  GildedRose.new('Aged Brie', 49, 5)
          item.tick

          expect(item.quality).to eql 50
          expect(item.days_remaining).to eql 4
        end

        it 'brie item with max quality' do
          item =  GildedRose.new('Aged Brie', 50, 5)
          item.tick

          expect(item.quality).to eql 50
          expect(item.days_remaining).to eql 4
        end
      end

      context 'after sell date' do
        it 'brie item' do
          item =  GildedRose.new('Aged Brie', 10, -10)
          item.tick

          expect(item.quality).to eql 12
          expect(item.days_remaining).to eql -11
        end
      end
    end

    context 'with a sulfuras' do
      it 'sulfuras' do
        item =  GildedRose.new('Sulfuras, Hand of Ragnaros', 80, 5)
        item.tick

        expect(item.quality).to eql 80
        expect(item.days_remaining).to eql 5
      end

      it 'sulfuras_before_sell_date' do
        item =  GildedRose.new('Sulfuras, Hand of Ragnaros', 80, 5)
        item.tick

        expect(item.quality).to eql 80
        expect(item.days_remaining).to eql 5
      end

      it 'sulfuras_on_sell_date' do
        item =  GildedRose.new('Sulfuras, Hand of Ragnaros', 80, 0)
        item.tick

        expect(item.quality).to eql 80
        expect(item.days_remaining).to eql 0
      end

      it 'sulfuras_after_sell_date' do
        item =  GildedRose.new('Sulfuras, Hand of Ragnaros', 80, -10)
        item.tick

        expect(item.quality).to eql 80
        expect(item.days_remaining).to eql -10
      end
    end

    context 'with a backstage object' do
      it 'backstage' do
        item =  GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 5)
        item.tick

        expect(item.quality).to eql 13
        expect(item.days_remaining).to eql 4
      end

      context 'long before sell date' do
        it 'backstage' do
          item =  GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 11)
          item.tick

          expect(item.quality).to eql 11
          expect(item.days_remaining).to eql 10
        end

        it 'at max quality' do
          item =  GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 11)
        end
      end

      context 'medium close to sell date (upper bound)' do
        it 'backstage' do
          item =  GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)
          item.tick

          expect(item.quality).to eql 12
          expect(item.days_remaining).to eql 9
        end

        it 'at max quality' do
          item =  GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 11)
          item.tick

          expect(item.quality).to eql 50
          expect(item.days_remaining).to eql 10
        end
      end

      context 'medium close to sell date (lower bound)' do
        it 'backstage' do
          item =  GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 6)
          item.tick

          expect(item.quality).to eql 12
          expect(item.days_remaining).to eql 5
        end

        it 'at max quality' do
          item =  GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 11)
          item.tick

          expect(item.quality).to eql 50
          expect(item.days_remaining).to eql 10
        end
      end

      context 'very close to sell date (upper bound)' do
        it 'backstage' do
          item =  GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 5)
          item.tick

          expect(item.quality).to eql 13
          expect(item.days_remaining).to eql 4
        end

        it 'at max quality' do
          item =  GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 11)
          item.tick

          expect(item.quality).to eql 50
          expect(item.days_remaining).to eql 10
        end
      end

      context 'very close to sell date (lower bound)' do
        it 'backstage' do
          item =  GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 1)
          item.tick

          expect(item.quality).to eql 13
          expect(item.days_remaining).to eql 0
        end

        it 'at max quality' do
          item =  GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 11)
          item.tick

          expect(item.quality).to eql 50
          expect(item.days_remaining).to eql 10
        end
      end

      context 'on sell date' do
        it 'backstage' do
          item =  GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 0)
          item.tick

          expect(item.quality).to eql 0
          expect(item.days_remaining).to eql -1
        end
      end

      context 'after sell date' do
        it 'backstage' do
          item =  GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, -10)
          item.tick

          expect(item.quality).to eql 0
          expect(item.days_remaining).to eql -11
        end
      end
    end

    context 'conjured' do
      it 'before_sale_date' do
        pending
        fail
      end
      it 'at_zero_quality' do
        pending
        fail
      end
      it 'on_sell_date' do
        pending
        fail
      end
      it 'on_sell_date_at_zero_quality' do
        pending
        fail
      end
      it 'after_sell_date' do
        pending
        fail
      end
      it 'after_sell_date_at_zero_quality' do
        pending
        fail
      end
    end

  end
end