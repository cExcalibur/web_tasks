class Changetousers < ActiveRecord::Migration[5.1]
  def change
    remove_column :admins, :password, :string
    add_column :admins, :password_digest, :string
  end
end
