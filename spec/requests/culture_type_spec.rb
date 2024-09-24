require 'rails_helper'

RSpec.describe 'CultureType', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get culture_types_path
      expect(response).to have_http_status(:success)
    end

    let!(:culture_type) { create(:culture_type) }

    it 'assigns @culture_types' do
      get culture_types_path
      expect(assigns(:culture_types)).to eq([culture_type])
    end

    it 'renders the index template' do
      get culture_types_path
      expect(response.body).to include(culture_type.name)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) { attributes_for(:culture_type) }

      it 'creates a new culture type' do
        expect {
          post culture_types_path, params: { culture_type: valid_attributes }
        }.to change(CultureType, :count).by(1)
      end

      it 'redirects to the culture types index after successful creation' do
        post culture_types_path, params: { culture_type: valid_attributes }
        expect(response).to redirect_to(culture_types_path)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_parameters) { attributes_for(:culture_type, name: '') }

      it 'does not create a new CultureType' do
        expect {
          post culture_types_path, params: { culture_type: invalid_parameters }
        }.to_not change(CultureType, :count)
        expect(response).to render_template(:new)
      end
    end
  end
end
