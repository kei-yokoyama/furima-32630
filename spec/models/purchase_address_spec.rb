require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe PurchaseAddress do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)

    before do
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    describe '商品購入機能' do
      context '購入がうまくいくとき' do
        it 'user_id,item_id,token(クレジットカード情報),postal_code,prefecture_id,city,address1,telephoneが存在すれば購入' do
          expect(@purchase_address).to be_valid
        end

        it '建物名が空でも購入できること' do
          @purchase_address.address2 = nil
          expect(@purchase_address).to be_valid
        end
      end

      context '購入がうまくいかないとき' do
        it 'user_idが空' do
          @purchase_address.user_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが空' do
          @purchase_address.item_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
        end

        it 'token(クレジットカード情報)が空' do
          @purchase_address.token = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Token クレジットカード情報が間違っています')
        end

        it 'postal_codeが空' do
          @purchase_address.postal_code = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'postal_codeがハイフン無し' do
          @purchase_address.postal_code = '1234567'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Postal code 郵便番号をハイフン込みで半角数字入力してください')
        end

        it 'postal_codeに全角数字が含まれている' do
          @purchase_address.postal_code = '１２３-４５６７'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Postal code 郵便番号をハイフン込みで半角数字入力してください')
        end

        it 'prefectureが空' do
          @purchase_address.prefecture_id = 1
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Prefecture 選択していない項目があります')
        end

        it 'cityが空' do
          @purchase_address.city = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("City can't be blank")
        end

        it '住所が空' do
          @purchase_address.address1 = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Address1 can't be blank")
        end

        it 'telephone番号が空' do
          @purchase_address.telephone = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Telephone can't be blank")
        end

        it 'telephone番号に半角数字以外(ハイフンなど)が含まれている' do
          @purchase_address.telephone = '000-1234-5678'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Telephone 電話番号を半角数字のみ(ハイフン無し)11桁以内で入力してください')
        end

        it 'telephone番号に全角数字が含まれている' do
          @purchase_address.telephone = '０００１２３４５６７８'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Telephone 電話番号を半角数字のみ(ハイフン無し)11桁以内で入力してください')
        end

        it 'telephone番号が11桁を超えている' do
          @purchase_address.telephone = '000123456789'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Telephone 電話番号を半角数字のみ(ハイフン無し)11桁以内で入力してください')
        end
      end
    end
  end
end
