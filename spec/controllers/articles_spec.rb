require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET /index' do
    let(:articles) { create_list(:article, 3) }

    before do
      get :index
    end

    it 'assigns @articles' do
      assigned_articles = assigns(:articles)

      expect(assigned_articles).to eq(articles)
    end
  end
end