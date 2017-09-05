class Feedback < ApplicationRecord
  validates :content, presence: true
  validates :nickname, presence: true
end
