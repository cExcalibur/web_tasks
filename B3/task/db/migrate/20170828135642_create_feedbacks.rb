class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :content
      t.date :created_at
      t.integer :admin_id

    end
  end
end
