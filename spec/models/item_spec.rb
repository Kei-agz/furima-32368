require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    describe"商品出品" do
      context '商品出品がうまく行く時' do
        it 'name, explanation, category_id, status_id, delivery_fee_id, sipping_area_id, delivery_day_id, priceが存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end
      context '商品出品がうまくいかない時' do
        it 'nameが空だと出品できない' do
          @item.name = ''
          @user.valid?
        
      end
    end
  end
end
