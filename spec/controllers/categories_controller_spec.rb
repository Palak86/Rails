require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  describe '#create' do
    let!(:category) { FactoryBot.create(:category)  }
    it 'redirects to @category' do
      post :create, params: {category: { name: category.name } }
      expect(response).to have_http_status(302)
    end
  end
end