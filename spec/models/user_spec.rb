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
        binding.pry
        expect(user).to incrude ("Nickname can't be blank")
      end
    end


  end

  end
end

=begin ○新規登録がうまくいくとき
①nicknameとemail,password,password確認、名字、名前、名字カナ、名前カナ、生年月日が存在

○新規登録できない。
・①がどれか一つでも空
・emailの一意性
・emailに@ない
・password 5文字以下
・password 英数混合
・password 確認との一致
・名字 半角文字
・名字 全角英数字記号
・名前 半角文字
・名前 全角英字数字記号
・birthday 数字でない 
=end