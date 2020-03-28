require 'rails_helper'

RSpec.describe CardsController, type: :controller do

  describe '#create' do
  it "全ての項目があれば登録出来る" do
    card = build(:card)
    card.save
    expect(card.save).to be true
  end
  end
end
