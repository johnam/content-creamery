require 'rails_helper'

RSpec.describe ArticlesController, type: :request do

  describe '#show' do

    it 'displays the article' do
      article = create(:article)

      get article_path(article.slug)

      expect(assigns(:article)).to eq(article)
      expect(response.status).to eq 200
    end

    it 'does not display an unpublished article' do
      article = create(:article, published: false)

      get article_path(article.slug)

      expect(response.status).to eq 302
      expect(response).to redirect_to root_path
    end

    it 'does not display an unsummarized article' do
      article = create(:article, published: true, summary: '')

      get article_path(article.slug)

      expect(response.status).to eq 302
      expect(response).to redirect_to root_path
    end

  end

  describe '#preview' do

    it 'displays an article' do
      article = create(:article)

      get article_preview_path(article.preview_key, article)

      expect(response.status).to eq 200
    end

    it 'requires a preview key' do
      article = create(:article)

      get article_preview_path('bad key', article)

      expect(response.status).to eq 401
    end

  end

end