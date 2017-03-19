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

  describe "GET #show" do
    let(:product) { create(:product, name: 'Product 1') }

    context "product exists" do
      it 'returns a product' do
        get :show, id: product.id, format: :json
        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json['name']).to eq('Product 1')
      end
    end

    context "product does not exists" do
      it "raise active record not found" do
        expect { get :show, id: 10000, format: :json }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
