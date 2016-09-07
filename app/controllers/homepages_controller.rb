class HomepagesController < ApplicationController

  def show
    @sign_up = SignUp.new
    @articles = Article.published_on_homepage.order('published_at desc').page(params[:page]).per(15)
    @articles_left,
    @articles_center,
    @articles_right = @articles.round_robin_split_into(3)
  end

end
