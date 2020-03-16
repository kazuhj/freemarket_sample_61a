require 'rails_helper'

describe Card do
  describe '#create' do
    # 1. customer_number、year、month、security_code、user_idが存在すれば登録できること
    it "customer_number、year、month、security_code、user_idが存在すれば登録できます" do
      card = build(:card)
      expect(card).to be_valid
    end

    # 2.customer_number が空では登録できないこと
    it "customer_numberが空だと登録出来ません" do
      card = build(:card, customer_number: nil)
      card.valid?
      expect(card.errors[:customer_number]).to include("can't be blank")
    end

    # 3. customer_numberが半角数字だと登録できること
    it "customer_numberが半角数字だと登録出来ます" do
      card = build(:card, customer_number: "0000000000")
      card.valid?
      expect(customer_number).to be_valid
    end

    # 14. customer_numberが半角数字以外では登録できないこと
    it "customer_numberが半角数字以外だと登録出来ません " do
      card = build(:card, customer_number: "a_00000")
      card.valid?
      expect(card.errors[:customer_number]).to include("は半角数字で入力して下さい")
    end

    # 2.yearが空では登録できないこと
    it "yearが空だと登録出来ません" do
      card = build(:card, year: nil)
      card.valid?
      expect(card.errors[:year]).to include("can't be blank")
    end

    # 2.monthが空では登録できないこと
    it "monthが空だと登録出来ません" do
      card = build(:card, month: nil)
      card.valid?
      expect(card.errors[:month]).to include("can't be blank")
    end

    # 2.security_codeが空では登録できないこと
    it "security_codeが空だと登録出来ません" do
      card = build(:card, security_code: nil)
      card.valid?
      expect(card.errors[:security_code]).to include("can't be blank")
    end

    # 3. security_codeが半角数字だと登録できること
    it "security_codeが半角数字だと登録出来ます" do
      card = build(:card, security_code: "0000000000")
      card.valid?
      expect(security_code).to be_valid
    end

    # 14. security_codeが半角数字以外では登録できないこと
    it "security_codeが半角数字以外だと登録出来ません " do
      card = build(:card, security_code: "a_00000")
      card.valid?
      expect(card.errors[:security_code]).to include("は半角数字で入力して下さい")
    end
  end
end
