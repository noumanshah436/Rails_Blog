class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  #  this will ensure that all articles have a title that is at least five characters long
  validates :title, presence: true, length: { minimum: 5 }
end



# If you delete an article, its associated comments will also need to be deleted, otherwise they would simply occupy space in the database. Rails allows you to use the dependent option of an association to achieve this.
