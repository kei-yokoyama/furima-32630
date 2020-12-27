require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe PurchaseAddress do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    describe '商品購入機能' do
      context '購入がうまくいくとき' do
        it 'user_id、item_id、token,postal_code,prefecture_id,city,address1,telephoneが存在すれば購入' do
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

        it 'tokenが空' do
          @purchase_address.token = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Token クレジットカード情報が間違っています')
        end

        it 'postal_codeが空' do
          @purchase_address.postal_code = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'prefectureが空' do
          @purchase_address.prefecture_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture 選択していない項目があります')
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
      end
    end
  end
end
