require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品の購入' do
    context '商品の購入ができる場合' do
      it "すべてのフォームの入力がされている" do
        expect(@order_address).to be_valid
      end
      it "郵便番号があれば保存ができること" do
        @order_address.postal_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it "郵便番号にハイフンがあれば保存ができること" do
        @order_address.postal_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it "都道府県があれば保存できる" do
        @order_address.item_prefecture_id = 2
        expect(@order_address).to be_valid
      end
      it "市区町村があれば保存できる" do
        @order_address.municipality = '1'
        expect(@order_address).to be_valid
      end
      it "番地があれば保存できる" do
        @order_address.address = '1-1'
        expect(@order_address).to be_valid
      end
      it "建物名が空の場合でも保存できること" do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
      it "電話番号があれば保存できること" do
        @order_address.phone_number = '00000000000'
        expect(@order_address).to be_valid
      end
      it "電話番号が11桁以内の数値のみであれば保存できること" do
        @order_address.phone_number = '00000000000'
        expect(@order_address).to be_valid
      end
      it "tokenがあれば保存できること" do
        expect(@order_address).to be_valid
      end
    end

    context '商品の購入ができない場合' do
      it '郵便番号が空では登録できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空では登録できないこと' do
        @order_address.item_prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it '都道府県が1では保存できないこと' do
        @order_address.item_prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item prefecture must be other than 1")
      end
      it '市区町村が空では保存できないこと' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が英数混合では保存できないこと' do
        @order_address.phone_number = '００００００００aaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is not a number")
      end
      it '電話番号が全角だと保存できないこと' do
        @order_address.phone_number = '０００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is not a number")
      end
      it '電話番号が11桁以内の数値のみでなければ保存できないこと' do
        @order_address.phone_number = '000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Only numbers within 11 numbers")
      end
      it 'tokenが空では保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
