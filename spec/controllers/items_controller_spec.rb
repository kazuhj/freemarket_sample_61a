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

  describe 'Get #index' do
    it "@itemsのcreared_atの値が降順で並ぶようになっているか" do
      item = create_list(:item, 3)
      get :index
      expect(assigns(:items)).to match(item.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "出品した商品がトップページに表示されるか" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
      it "newアクションでnew.html.hamlに遷移するようになっているか？" do
        get :new
        expect(response).to render_template :new
      end
    end

  describe 'GET #show' do
    it "【商品詳細表示】インスタンス変数の値が期待したものになるか" do
      item = create(:item)
      get :show, params: { id: item}
      expect(assigns(:item)).to eq item
    end
    it "詳細ページへ遷移するか" do
      item = create(:item)
      get :show, params: {id: item}
      expect(response).to render_template :show
    end
  end

  describe 'GET #show_mine' do
    it "【出品商品ページ】インスタンス変数の値が期待したものになるか" do
      item = create(:item)
      get :show_mine, params: { id: item}
      expect(assigns(:item)).to eq item
    end
    it "詳細ページへ遷移するか" do
      item = create(:item)
      get :show_mine, params: {id: item}
      expect(response).to render_template :show_mine
    end
  end

end