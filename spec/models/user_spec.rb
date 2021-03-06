require 'rails_helper'

describe User do
  describe '#create' do
    # 1. nickname、email、password、family_name、first_name、family_name_kana、first_name_kana、birth_year、birth_month、birth_dayが存在すれば登録できること
    it "ニックネーム、メール、password、お名前（漢）、お名前（カナ）、生年月日が存在すれば登録できます" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "ニックネームが空だと登録出来ません" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3. emailが空では登録できないこと
    it "emailが空だと登録出来ません" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 4. 重複したemailが存在する場合登録できないこと
    it "重複したemail addressが存在すると登録出来ません" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 5. passwordが空では登録できないこと
    it "passwordが空だと登録出来ません" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください","は不正な値です")
    end

    # 6. passwordが半角英数字の7文字以上であれば登録できること
    it "passwordが半角英数字の7文字以上であれば登録出来ます" do
      user = build(:user, password: "a000000", password_confirmation: "a000000")
      user.valid?
      expect(user).to be_valid
    end

    # 7. passwordが６文字以下では登録できないこと
    it "passwordが6文字以下だと登録出来ません " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    # 8. passwordが7文字以上でも半角英数字以外では登録できないこと
    it "passwordが7文字以上でも半角英数字以外だと登録出来ません " do
      user = build(:user, password: "0_00000", password_confirmation: "0_00000")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    # 9. family_nameが空だと登録出来ないこと
    it "family_nameが空だと登録出来ません" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    # 10. first_nameが空だと登録出来ないこと
    it "first_nameが空だと登録出来ません" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    # 11. family_name_kanaが空だと登録出来ないこと
    it "family_name_kanaが空だと登録出来ません" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください", "は不正な値です")
    end

    #12. family_name_kanaはカタカナorひらがなで登録OK
    it "family_name_kanaはカタカナorひらがなで登録出来ます" do
      user = build(:user, family_name_kana: "カタかな")
      expect(user).to be_valid
    end

    # 13. family_name_kanaがカタカナorひらがな以外では登録できないこと
    it "family_name_kanaはカタカナorひらがな以外では登録出来ません " do
      user = build(:user, family_name_kana: "katakana")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    # 14. first_name_kanaが空だと登録出来ないこと
    it "first_name_kanaが空だと登録出来ません" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください", "は不正な値です")
    end

    #15. first_name_kanaはカタカナorひらがなで登録OK
    it "first_name_kanaはカタカナorひらがなで登録出来ます" do
      user = build(:user, first_name_kana: "カタかな")
      expect(user).to be_valid
    end

    # 16. first_name_kanaがカタカナorひらがな以外では登録できないこと
    it "first_name_kanaはカタカナorひらがな以外では登録出来ません " do
      user = build(:user, first_name_kana: "katakana")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    # 17. birth_yearが空だと登録出来ないこと
    it "birth_yearが空だと登録出来ません" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    # 18. birth_monthが空だと登録出来ないこと
    it "birth_monthが空だと登録出来ません" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    # 19. birth_dayが空だと登録出来ないこと
    it "birth_dayが空だと登録出来ません" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end

    # 20. パスワードが存在してもパスワード確認の値が違うと登録できないこと
    it "パスワードとパスワード確認の値が違うと登録出来ない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

  end
end


