step 'there is an article' do
  FactoryGirl.create(:article)
end

step 'I am viewing the article' do
  article = Article.first

  visit article_path(article.slug)
end

step 'I sign up for the newsletter twice on an article page with :email' do |email|
  step "I sign up for the newsletter with '#{email}'"
  step 'I am viewing the article'
  step "I sign up for the newsletter with '#{email}'"
end