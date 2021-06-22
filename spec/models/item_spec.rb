require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '投稿の保存' do
    context "投稿が保存できる場合" do
      it '全ての項目が存在すれば保存できる' do
        expect(@item).to be_valid
      end

      it "商品名があれば投稿は保存される" do
        @item.item_name = 'あ'
        expect(@item).to be_valid
      end
      it "商品の説明があれば投稿は保存される" do
        @item.item_name = 'あ'
        expect(@item).to be_valid
      end
      it "カテゴリーがあれば投稿は保存される" do
        @item.item_category_id = '2'
        expect(@item).to be_valid
      end
      it "商品の状態があれば投稿は保存される" do
        @item.item_sales_status_id = '2'
        expect(@item).to be_valid
      end
      it "配送料の負担があれば投稿は保存される" do
        @item.item_shipping_fee_status_id = '2'
        expect(@item).to be_valid
      end
      it "配送元の地域があれば投稿は保存される" do
        @item.item_prefecture_id = '2'
        expect(@item).to be_valid
      end
      it "発送までの日数があれば投稿は保存される" do
        @item.item_scheduled_delivery_id = '2'
        expect(@item).to be_valid
      end
      it "販売価格があれば投稿は保存される" do
        @item.item_price = '300'
        expect(@item).to be_valid
      end
    end

    context "投稿が保存できない時" do
      it "画像がないと保存はできない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと保存はできない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "商品の説明がないと保存はできない" do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "カテゴリーがないと保存はできない" do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category is not a number")
      end
      it "商品の状態がないと保存はできない" do
        @item.item_sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status is not a number")
      end
      it "配送料の負担がないと保存はできない" do
        @item.item_shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status is not a number")
      end
      it "配送元の地域がないと保存はできない" do
        @item.item_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture is not a number")
      end
      it "発送までに日数がないと保存はできない" do
        @item.item_scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery is not a number")
      end
      it "販売価格がないと保存はできない" do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
    end
  end
end
