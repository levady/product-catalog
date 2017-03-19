require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  describe "GET #index" do
    let!(:products) do
      create(:product, name: 'Product 1')
      create(:product, name: 'Product 2')
    end

    it 'returns products' do
      get :index, format: :json
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json.count).to eq(2)
      expect(json.map { |p| p['name'] }).to contain_exactly('Product 1', 'Product 2')
    end
  end
end
