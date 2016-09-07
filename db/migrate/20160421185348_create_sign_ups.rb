class CreateSignUps < ActiveRecord::Migration
  def change
    create_table :sign_ups do |t|
      t.citext :email, null: false
      t.integer :age
      t.text :gender
      t.boolean :synced, null: false, default: false

      t.timestamps null: false
    end

    add_index :sign_ups, :email, unique: true
  end
end
