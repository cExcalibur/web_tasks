class Removeforfeedbacks < ActiveRecord::Migration[5.1]
  def change
    remove_column :feedbacks, :admin_id, :integer
  end
end
