require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    describe "ユーザー新規登録" do
      context '新規登録がうまく行くとき' do
        it 'nickname、email、password、password_confirmation、last_name、first_name、
        last_name_read、first_name_read、bornが存在すれば登録できる' do
        expect(@user).to be_valid
        end
  
        it 'passwordが6文字以上であれば登録できる' do
          @user.password = '890iop'
          @user.password_confirmation = '890iop'
          expect(@user).to be_valid
        end
      end
  
      context "新規登録がうまくいかない時" do
        it "nicknameが空だと登録できない" do
          user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
          user.valid?
          expect(user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空では登録できない" do
          user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
          user.valid?
          expect(user.errors.full_messages).to include("Email can't be blank")
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it 'emailに@が含まれていない場合登録できない' do
          @user.email = 'hogehuga.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'password_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordが5文字以下であれば登録できない' do
          @user.password = '890io'
          @user.password_confirmation = '890io'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '890iop'
          @user.password_confirmation = '123qwe'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordが半角英数字混合でなければ登録できない(英字のみ)' do
          @user.password = 'asdzxc'
          @user.password_confirmation = 'asdzxc'
          @user.valid?
        end

        it 'passwordが半角英数字混合でなければ登録できない(数字のみ)' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
        end

        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end
  
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
  
        it 'last_name_readが空では登録できない' do
          @user.last_name_read = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name read is invalid", "Last name read can't be blank")
        end
  
        it 'first_name_readが空では登録できない' do
          @user.first_name_read = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name read is invalid", "First name read can't be blank")
        end
  
        it 'bornが空では登録できない' do
          @user.born = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Born can't be blank")
        end

        it 'last_nameが全角文字でなければ登録できない' do
          @user.last_name = 'hoge'
          @user.valid?
        end
  
        it 'first_nameが全角文字でなければ登録できない' do
          @user.first_name = 'huga'
          @user.valid?
        end
  
        it 'last_name_readが全角カタカナでなければ登録できない' do
          @user.last_name_read = 'あああああ'
          @user.valid?
        end
  
        it 'first_name_readが全角カタカナでなければ登録できない' do
          @user.first_name_read = 'ｱｱｱｱｱ'
          @user.valid?
        end
      end
    end
  end
end