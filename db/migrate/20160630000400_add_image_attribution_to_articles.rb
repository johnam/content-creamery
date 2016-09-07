class AddImageAttributionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_attribution, :text
  end
end
