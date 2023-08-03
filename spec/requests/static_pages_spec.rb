# Frozen_string_literal: true

require 'rails_helper'
# , type: :request
RSpec.describe 'StaticPages' do
  describe 'GET /' do
    it 'returns http success' do
      get root_url
      expect(response).to have_http_status(:success)
    end
  end
end
