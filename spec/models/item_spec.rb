require 'rails_helper'
RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it 'ログイン状態で、画像、名前、説明、カテゴリー、状態、配送料負担者、配送元地域、発送日数、価格が存在すれば出品' do
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do

        it 'userが紐付いていないと保存できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end

        it '画像が空では保存できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameが空' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'nameが40文字以上' do
          @item.name = "a" * 41
          @item.valid?
          expect(@item.errors.full_messages).to include("Name 40文字以内にしてください")
        end

        it '説明が空' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it '説明が1000文字以上' do
          @item.description = "a" *1001
          @item.valid?
          expect(@item.errors.full_messages).to include("Description 1000文字以内にしてください")
        end

        it 'カテゴリーが空' do
          @item.category = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it '状態が空' do
          @item.condition = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end

        it '配送料負担者が空' do
          @item.shipping_payer = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping payer can't be blank")
        end

        it '配送元地域が空' do
          @item.prefecture = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it '配送元日数が空' do
          @item.shipping_duration = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping duration can't be blank")
        end

        it '価格が空' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '価格が¥300より低い' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price (金額)を¥300 ~ 9,999,999 内で半角数字入力してください")
        end

        it '価格が¥9,999,999より高い' do
          @item.price = 10,000,000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price (金額)を¥300 ~ 9,999,999 内で半角数字入力してください")
        end

        it '価格が半角数字でない' do
          @item.price = '１００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price (金額)を¥300 ~ 9,999,999 内で半角数字入力してください")
        end

      end
    end
  end
end
