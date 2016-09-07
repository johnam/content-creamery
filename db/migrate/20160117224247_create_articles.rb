class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :url
      t.text :title
      t.text :subtitle
      t.text :author
      t.text :publication
      t.text :publication_url
      t.text :summary
      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
