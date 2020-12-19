require 'rails_helper'
RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nicknameとemail,password,password確認、名字、名前、名字カナ、名前カナ、生年月日が存在すれば登録' do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailに@なし' do
          @user.email = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'emailが別アカウントにすでに存在' do
          another_user = FactoryBot.create(:user)
          @user.email = another_user.email
          @user.valid?
          expect(@user.errors.full_messages).to include('Email has already been taken')
        end

        it 'passwordが空' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが5文字以下' do
          @user.password = 'a1234'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordが半角数字だけでは登録ができない' do
          @user.password = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password 英語、数字 それぞれ1文字以上を半角入力してください')
        end

        it 'passwordが半角アルファベットだけでは登録ができない' do
          @user.password = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password 英語、数字 それぞれ1文字以上を半角入力してください')
        end

        it 'passwordが半角でない文字がある' do
          @user.password = '123456aｐ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password 英語、数字 それぞれ1文字以上を半角入力してください')
        end

        it 'passwordとpassword確認が不一致' do
          @user.password_confirmation = 'a12345'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it '名字が空' do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end

        it '名字が漢字、全角ひら、全角カナで入力できていない' do
          @user.family_name = 'myouji'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name 漢字、全角ひらがな、全角カタカナ を入力してください')
        end

        it '名前が空' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it '名前が漢字、全角ひら、全角カナで入力できていない' do
          @user.first_name = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name 漢字、全角ひらがな、全角カタカナ を入力してください')
        end

        it '名字カナが空' do
          @user.family_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end

        it '名字カナが全角カナで入力できていない' do
          @user.family_name_kana = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name kana 全角カタカナ を入力してください')
        end

        it '名前カナが空' do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it '名前が全角カナで入力できていない' do
          @user.first_name_kana = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana 全角カタカナ を入力してください')
        end

        it '生年月日が空' do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

        it '生年月日が日付でない文字列' do
          @user.birthday = '123'
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end
