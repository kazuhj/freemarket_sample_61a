require 'rails_helper'

describe Item do
  describe '#create' do
    it "nameが空では登録不可" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
    it "textが空では登録不可" do
      item = build(:item, text: nil)
      item.valid?
      expect(item.errors[:text]).to include("を入力してください")
    end
    it "conditionが空では登録不可" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end
    it "conditionが空では登録不可" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end
    it "priceが空では登録不可" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
    it "fee_burdenが空では登録不可" do
      item = build(:item, fee_burden: nil)
      item.valid?
      expect(item.errors[:fee_burden]).to include("を入力してください")
    end
    it "serviceが空では登録不可" do
      item = build(:item, service: nil)
      item.valid?
      expect(item.errors[:service]).to include("を入力してください")
    end
    it "areaが空では登録不可" do
      item = build(:item, area: nil)
      item.valid?
      expect(item.errors[:area]).to include("を入力してください")
    end
    it "handing_timeが空では登録不可" do
      item = build(:item, handing_time: nil)
      item.valid?
      expect(item.errors[:handing_time]).to include("を入力してください")
    end
    it "categoryが空では登録不可" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end
    it "sales_statusが空では登録不可" do
      item = build(:item, sales_status: nil)
      item.valid?
      expect(item.errors[:sales_status]).to include("を入力してください")
    end
    it "imageが空では登録不可" do
      @image = FactoryBot.create(:image)
      image = @image
      item = build(:item, image: nil)
      item.valid?
      expect(item.errors[:image]).to include("を入力してください")
    end
    it "nameが40文字以上では登録不可" do
      #item = build(:item, name: <40)?
      item.valid?
      expect(item.errors[:name]).to include("40文字以下で入力してください")
    end
    
    it "name,text,condition,price,fee_burden,service,area,handing_time,category,user_id,sales_status,が存在しないと出品できない" do
      @user = FactoryBot.create(:user)
      user = @user
      item = build(:item)
      expect(item).to be_valid
    end
  end
end
