require 'rails_helper'

RSpec.describe 'Applicant', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get applicants_path
      expect(response).to have_http_status(:success)
    end

    let!(:applicant) { create(:applicant)}

    it 'assigns @applicants' do
      get applicants_path
      expect(assigns(:applicants)).to eq([applicant])
    end

    it 'renders the index template' do
      get applicants_path
      expect(response.body).to include(applicant.first_name)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:culture_type) { create(:culture_type) }
      let(:valid_attributes) { attributes_for(:applicant, culture_type_id: culture_type.id) }

      it 'creates a new applicant' do
        expect {
          post applicants_path, params: { applicant: valid_attributes }
        }.to change(Applicant, :count).by(1)
      end

      it 'redirects to the applicants index after successful creation' do
        post applicants_path, params: { applicant: valid_attributes }
        expect(response).to redirect_to(applicants_path)
      end
    end

    context 'with invalid parameters' do
      let!(:invalid_parameters) { attributes_for(:applicant, first_name: '') }

      it 'does not create a new Applicant' do
        expect {
          post applicants_path, params: { applicant: invalid_parameters }
        }.to_not change(Applicant, :count)
        expect(response).to render_template(:new)
      end
    end
  end
end
