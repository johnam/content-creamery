module ArticlesHelper

  def fb_description(article)
    if article.subtitle.present?
      article.subtitle
    else
      truncate(article.summary, length: 200)
    end
  end

end