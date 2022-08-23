class Article < ApplicationRecord
  has_many :comments
  #  this will ensure that all articles have a title that is at least five characters long
  validates :title, presence: true, length: { minimum: 5 }
end
