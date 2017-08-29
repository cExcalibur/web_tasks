class Addforfeedbacks < ActiveRecord::Migration[5.1]
  def change
    add_column :feedbacks, :nickname, :string
  end
end
