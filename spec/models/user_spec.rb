require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "全ての項目の入力が存在すれば登録できること" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameがない場合は登録できないこと" do 
        @user.nickname = '' 
        @user.valid? 
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end

      it "emailがない場合は登録できないこと" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordがない場合は登録できないこと" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "パスワードが6文字未満では登録できないこと" do
        @user.password = '1234z'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "英字のみのパスワードは登録できない" do
        @user.password = 'asdfghh'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it "数字のみのパスワードは登録できない" do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it "全角文字を含むパスワードでは登録できない" do
        @user.password = '１２３４５dv'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it "パスワードと確認用パスワードが不一致だと登録できない" do
        @user.password_confirmation = 'asdfgh1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "last_nameがない場合は登録できないこと" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "last_name_kanaが半角の場合は登録できないこと" do
        @user.last_name_kana = 'ﾅｶﾀ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end

      it "first_nameがない場合は登録できないこと" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_name_kanaが半角の場合は登録できないこと" do
        @user.first_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end

      it "birthday_yearがない場合は登録できないこと" do
        @user.birthday_year = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday year can't be blank")
      end
    end
  end
end