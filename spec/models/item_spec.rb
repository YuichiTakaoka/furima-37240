require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品が出品できること' do
      it '全ての記述が正しく入力されている' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it '画像が無いと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空だと出品できない' do
        @item.concept = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept can't be blank")
      end
      it 'カテゴリー選択をしていないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態を選択していないと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担を選択していないと出品できない' do
        @item.delivary_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivary fee can't be blank")
      end
      it '発送元地域を選択していないと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数を選択していないと出品できない' do
        @item.delivary_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivary day can't be blank")
      end
      it '販売価格が空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300円以下だと出品できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end
      it '販売価格が9,999,999以上だと出品できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end
      it '販売価格が全角数字だと出品できない' do
        @item.price = "２２２２"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end
      it '販売価格が文字だと出品できない' do
        @item.price = "ああああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
