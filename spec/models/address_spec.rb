RSpec.describe Address, type: :model do
  describe Address do
    before do
      @address = FactoryBot.build(:address)
    end

    describe '商品購入機能' do
      context '購入がうまくいくとき' do
        it 'user、itemがpurchaseにひも付き、postal_code,prefecture_id,city,address1,telephoneが存在すれば購入' do
          expect(@address).to be_valid
        end
      end

      context '購入がうまくいかないとき' do
        it 'purchase_idがaddressに紐付いていない' do
          @address.purchase = nil
          @address.valid?
          expect(@address.errors.full_messages).to include("Purchase can't be blank")
        end
      end
    end
  end
end
