require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '購入情報入力' do
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式出ないと保存できないこと' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県の選択が--だと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村を入力していないと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地を入力していないと保存できないこと' do
        @order_address.lot_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Lot number can't be blank")
      end
      it '電話番号を入力していないと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が全角では保存できないこと' do
        @order_address.phone_number = '０００１１１１２２２２'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number input only number")
      end
      it '電話番号が10字か11字でないと保存できないこと' do
        @order_address.phone_number = '0011'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number input number 10~11")
      end
      it 'クレジット情報を入力していないと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
