class AddNewsletterOptInToUsers < ActiveRecord::Migration
  def change
    add_column :users, :newsletter_opt_in, :boolean, null: false, default: false
  end
end
