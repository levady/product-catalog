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
      json = JSON.parse(response.body)["data"]
      expect(json.count).to eq(2)
      expect(json.map { |p| p.dig('attributes', 'name') }).to contain_exactly('Product 1', 'Product 2')
    end
  end

  describe "GET #show" do
    let(:product) { create(:product, name: 'Product 1') }

    context "product exists" do
      it 'returns a product' do
        get :show, id: product.id, format: :json
        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json.dig('data', 'attributes', 'name')).to eq('Product 1')
      end
    end

    context "product does not exists" do
      it "raise active record not found" do
        expect { get :show, id: 10000, format: :json }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "POST #create" do
    context "given valid params" do
      let(:data) do
        {
          attributes: {
            name: 'Product 1',
            description: 'Such an awesome product!',
            price: 5.5
          }
        }
      end

      it 'creates a product' do
        post :create, data: data, format: :json
        expect(response.status).to eq(201)
        json = JSON.parse(response.body)
        expect(json.dig('data', 'attributes', 'name')).to eq('Product 1')
        expect(json.dig('data', 'attributes', 'description')).to eq('Such an awesome product!')
        expect(json.dig('data', 'attributes', 'price')).to eq("5.5")
      end
    end

    context "given unallowed params" do
      let(:data) do
        {
          attributes: {
            name: 'Product 1',
            description: 'Such an awesome product!',
            price: 5.5,
            unallowed_attribute: "You shall not pass!"
          }
        }
      end

      it 'creates a product' do
        post :create, data: data, format: :json
        expect(response.status).to eq(201)
        json = JSON.parse(response.body)
        expect(json.dig('data', 'attributes', 'name')).to eq('Product 1')
        expect(json.dig('data', 'attributes', 'description')).to eq('Such an awesome product!')
        expect(json.dig('data', 'attributes', 'price')).to eq("5.5")
      end
    end

    context "validation errors" do
      before { create(:product, name: 'Duplicate me') }

      let(:data) do
        {
          attributes: {
            name: 'Duplicate me',
            description: 'Such an awesome product!',
            price: 5.5,
          }
        }
      end

      it "returns unprocessable_entity and error message" do
        post :create, data: data, format: :json
        expect(response.status).to eq(422)
        expect(response.body).to eq('Validation failed: Name has already been taken')
      end
    end
  end

  describe "PUT #update" do
    let(:product) { create(:product, name: 'Product 1', description: 'Lame', price: 5.0) }

    context "given valid params" do
      let(:data) do
        {
          attributes: { name: 'Product 1 updated', description: 'Not lame', price: 10.5 }
        }
      end

      it "update product" do
        put :update, id: product.id, data: data, format: :json
        expect(response).to have_http_status(:success)
        expect(product.reload.name).to eq('Product 1 updated')
        expect(product.description).to eq('Not lame')
        expect(product.price).to eq(10.5)
      end
    end

    context "validation errors" do
      let(:data) do
        {
          attributes: { name: nil, description: 'Not lame', price: 10.5 }
        }
      end

      it "update the product" do
        put :update, id: product.id, data: data, format: :json
        expect(response.status).to eq(422)
        expect(response.body).to eq('Validation failed: Name can\'t be blank')
      end
    end
  end

  describe "DELETE #destroy" do
    let(:product) { create(:product) }

    it "delete the product" do
      delete :destroy, id: product.id, format: :json
      expect(response).to have_http_status(:success)
      expect(Product.find_by(id: product.id)).to be_nil
    end
  end
end
