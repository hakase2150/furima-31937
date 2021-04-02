require 'rails_helper'

RSpec.describe UserBuyer, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @user_buyer = FactoryBot.build(:user_buyer, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '全ての項目が正しく入力されていれば商品購入できる' do
        expect(@user_buyer).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @user_buyer.building_name = ''
        expect(@user_buyer).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'tokenが空では商品購入できない' do
        @user_buyer.token = ''
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では商品購入できない' do
        @user_buyer.postal_code = ''
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeがハイフンなしでは商品購入できない' do
        @user_buyer.postal_code = '1234567'
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが数字でなければ商品購入できない' do
        @user_buyer.postal_code = 'テスト'
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空では商品購入できない' do
        @user_buyer.prefecture_id = ''
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが---を選択している状態では商品購入できない' do
        @user_buyer.prefecture_id = 1
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空では商品購入できない' do
        @user_buyer.city = ''
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では商品購入できない' do
        @user_buyer.block = ''
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では商品購入できない' do
        @user_buyer.phone_number = ''
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberがハイフンありでは商品購入できない' do
        @user_buyer.phone_number = '090-1234-5678'
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが数字でなければ商品購入できない' do
        @user_buyer.phone_number = 'テスト'
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空では商品購入できない' do
        @user_buyer.user_id = ''
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では商品購入できない' do
        @user_buyer.item_id = ''
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
