class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :pass
      t.date :created_at
      t.integer :post_id
    end
  end
end
