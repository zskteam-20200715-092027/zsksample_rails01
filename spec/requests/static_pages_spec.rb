require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe 'GET /' do
    it 'should get root' do
      get '/'
      expect(response).to have_http_status(200)
      expect(response.body).to include 'Implemented list'
    end
  end
end
