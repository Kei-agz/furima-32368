require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    describe"商品出品" do
      context '商品出品がうまく行く時' do
        it 'name, explanation, category_id, status_id, delivery_fee_id, sipping_area_id, delivery_day_id, price, user_idが存在すれば登録できる' do
          expect(@item).to be_valid
        end

        it 'imageが存在すると出品できること' do
          expect(@item).to be_valid
        end
    
        it "nameが40文字でも出品できること" do
          @item.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          expect(@item).to be_valid
        end

        it "priceが300ちょうどだと出品できること" do
          @item.price = 300
          expect(@item).to be_valid
        end

        it "priceが9999999だと出品できること" do
          @item.price = 9999999
          expect(@item).to be_valid
        end

        it "priceが半角数字だと出品できること" do
          @item.price =6000
          expect(@item).to be_valid
        end

      end
      context '商品出品がうまくいかない時' do
        it 'nameが空だと出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'explanationが空だと出品できない' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end

        it 'category_idが空だとうまくいかない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it "status_idが空だと出品できない " do
          @item.status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end

        it "delivery_fee_idが空だたと出品できない" do
          @item.delivery_fee_id =''
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
        end

        it "sipping_area_idが空だと出品できない" do
          @item.sipping_area_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Sipping area can't be blank")
        end

        it "delivery_day_idが空だと出品できない" do
          @item.delivery_day_id =''
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery day can't be blank")
        end

        it "priceが空だと出品できない" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it "nameが41文字だと出品できないこと" do
          @item.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
        end

        it "priceが299以下だと出品できないこと" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
     
        it "priceが10000000だと出品できないこと" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is too long (maximum is 7 characters)", "Price must be less than 10000000")
        end

        it "priceが半角数字でないと出品できないこと" do
          @item.price = "１２７７８"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is too short (minimum is 3 characters)", "Price is not a number")
        end

      end
    end
  end
end

