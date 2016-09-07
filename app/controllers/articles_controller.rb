class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :preview]

  def show
    redirect_to root_path and return if @article.draft? || !@article.summarized?

    unless user_signed_in? # do not send session cookie so cloudflare can cache html
      request.session_options[:skip] = true
    end

    response.headers['Cache-Control'] = 'public, max-age=1800, s-maxage=3600' # client: half hour, cdn: hour
  end

  def preview
    if params[:key] == @article.preview_key
      render :show
    else
      render html: 'not authorized', status: :unauthorized
    end
  end

  private

  def set_article
    @article = Article.friendly.find(params[:id])
    @sign_up = SignUp.new
  end
end
