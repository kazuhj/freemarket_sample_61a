require 'rails_helper'

describe ItemsController, type: :controller  do
  let(:user) { create(:user) }

  describe 'GET #destroy' do
    it "【商品削除】インスタンス変数の値が期待したものになるか" do
      item = create(:item)
      delete :destroy, params: { id: item }
      expect(assigns(:item)).to eq item
    end
  end
end