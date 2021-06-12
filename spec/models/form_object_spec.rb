require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @form_object = FactoryBot.build(:form_object, user_id: @user.id , item_id: @item.id)
    sleep 0.1
   end

  describe "商品購入" do
    context '商品購入がうまく行くとき' do
      it 'sipping_area_id、city、house_number、postal_code、phone_numberが存在すれば登録できる' do
      expect(@form_object).to be_valid
      end

      it '郵便番号にハイフンがあれば購入できる' do
        @form_object.postal_code = '512-2882'
        expect(@form_object).to be_valid
      end

      it '電話番号が11桁だと購入できる' do
        @form_object.phone_number = '11111111111'
        expect(@form_object).to be_valid
      end

      it '建物名が空でも購入できること' do
        @form_object.building_number = ''
        expect(@form_object).to be_valid
      end
    end

    context "商品購入がうまくいかない時" do
      it "sipping_area_idが空だと登録できない" do
        @form_object.sipping_area_id = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Sipping area can't be blank")
      end

      it "cityが空だと登録できない" do
        @form_object.city = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("City can't be blank")
      end

      it "house_numberが空だと登録できない" do
        @form_object.house_number = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("House number can't be blank")
      end

      it "postal_codeが空だと登録できない" do
        @form_object.postal_code = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Postal code can't be blank")
      end

      it "phone_numberが空だと登録できない" do
        @form_object.phone_number = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number can't be blank")
      end

      it "postal_codeにハイフンがないと購入できない" do
        @form_object.postal_code = '22222222'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Postal code is invalid")
      end

      it "tokenの値が空の場合購入できない" do
        @form_object.token = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Token can't be blank")
      end

      it "ユーザーのidが存在しない場合購入できない" do
        @form_object.user_id = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("User can't be blank")
      end

      it "商品のidが存在しない場合購入できない" do
        @form_object.item_id = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Item can't be blank")
      end

      it "電話番号が12桁以上では購入できない" do
        @form_object.phone_number = '233333323323'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号が英数混合では購入できない" do
        @form_object.phone_number = '2333we23323'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number is invalid")
      end

      it "sipping_area_id（都道府県）に対し存在しない数値を入力された場合購入できない" do
        @form_object.sipping_area_id = 1
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Sipping area must be other than 1")
      end

    end
  end
end

