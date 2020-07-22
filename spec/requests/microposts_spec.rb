require 'rails_helper'

RSpec.describe '/microposts', type: :request do
  let!(:user) { create(:user) }
  let!(:micropost) { create(:micropost, user: user) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get microposts_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get micropost_url(micropost)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_micropost_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      get edit_micropost_url(micropost)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    let(:new_attributes) { attributes_for(:micropost, content: 'MyString2') }
    it 'updates the requested micropost' do
      patch micropost_url(micropost), params: { micropost: new_attributes }
      micropost.reload
      expect(micropost.content).to eq 'MyString2'
    end

    it 'redirects to the micropost' do
      patch micropost_url(micropost), params: { micropost: new_attributes }
      micropost.reload
      expect(response).to redirect_to(micropost_url(micropost))
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested micropost' do
      expect do
        delete micropost_url(micropost)
      end.to change(Micropost, :count).by(-1)
    end

    it 'redirects to the microposts list' do
      delete micropost_url(micropost)
      expect(response).to redirect_to(microposts_url)
    end
  end
end
