require 'rails_helper'

RSpec.describe HomepagesController, type: :request do

  describe '#show' do

    it 'only displays published_on_homepage articles' do
      article1 = create(:article, published_on_homepage: true)
      article2 = create(:article, published_on_homepage: true)
      article3 = create(:article, published_on_homepage: true)
      article4 = create(:article, published: false)

      get root_path

      expect(assigns(:articles)).to match_array([article1, article2, article3])
      expect(response.status).to eq 200
    end

  end

end