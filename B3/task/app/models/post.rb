class Post < ApplicationRecord
  validates :title,  presence: true
  validates :text, presence:true
  belongs_to :admin
  has_many :comments
end
