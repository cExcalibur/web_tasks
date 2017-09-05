# Schema: Admin(name:string, password_digest:string)
class Admin < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: true
  has_many :posts
end
