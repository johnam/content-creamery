class AddSlugToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :slug, :text, null: false
    add_index :articles, :slug, unique: true
  end
end
