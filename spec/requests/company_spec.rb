require 'rails_helper'

RSpec.describe 'Companies', type: :request do
  describe 'GET /index' do
    let!(:company) { create(:company)}

    it 'returns a successful response' do
      get companies_path
      expect(response).to have_http_status(:success)
    end

    it 'assigns @companies' do
      get companies_path
      expect(assigns(:companies)).to eq([company])
    end

    it 'renders the index template' do
      get companies_path
      expect(response.body).to include(company.name)
    end
  end

  describe 'GET /show' do
    let!(:company) { create(:company) }

    it 'returns a successful response' do
      get company_path(company)
      expect(response).to have_http_status(:success)
    end

    it 'assigns @company' do
      get company_path(company)
      expect(assigns(:company)).to eq(company)
    end

    it 'renders the show template' do
      get company_path(company)
      expect(response).to render_template(:show)
      expect(response.body).to include(company.name)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:culture_type) { create(:culture_type) }
      let(:valid_attributes) { attributes_for(:company, culture_type_id: culture_type.id) }

      it 'creates a new company' do
        expect {
          post companies_path, params: { company: valid_attributes }
        }.to change(Company, :count).by(1)
      end

      it 'redirects to the company show after successful creation' do
        post companies_path, params: { company: valid_attributes }
        expect(response).to redirect_to(company_path(Company.last))
      end
    end

    context 'with invalid parameters' do
      let(:culture_type) { create(:culture_type) }
      let!(:invalid_parameters) { attributes_for(:company, name: '', culture_type_id: culture_type.id) }

      it 'does not create a new company' do
        expect {
          post companies_path, params: { company: invalid_parameters }
        }.to_not change(Company, :count)
        expect(response).to render_template(:new)
      end
    end
  end
end
