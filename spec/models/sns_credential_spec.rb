require 'rails_helper'

RSpec.describe SnsCredential, type: :model do

  it "uidがあれば登録出来る" do
    snscredential = build(:sns_credential, uid: "12345678")
    expect(snscredential).to be_valid
  end

  it "providerがあれば登録出来る" do
    snscredential = build(:sns_credential, provider: "google_oauth2")
    expect(snscredential).to be_valid
  end

  it "user_idがあれば登録出来る" do
    snscredential = build(:sns_credential, user_id: "1")
    expect(snscredential).to be_valid
  end

  it "全ての項目があれば登録出来る" do
    snscredential = build(:sns_credential)
    expect(snscredential).to be_valid
  end
end

