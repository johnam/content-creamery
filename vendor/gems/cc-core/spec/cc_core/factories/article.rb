FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "Article Title #{n}" }
    subtitle 'Article Subtitle'
    sequence(:url) { |n| "http://article.com/#{n}" }
    author 'Bob Harris'
    publication 'The Daily Read'
    summary 'Article summary'
    published true
  end
end