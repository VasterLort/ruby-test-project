class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, miaximum: 50 }
  validates :description, presence: true, length:  { minimum: 10, miaximum: 250 }
end
