class AddPublishedOnHomepageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :published_on_homepage, :boolean, default: false
  end
end
