class Article < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }

  #This creates comments as a nested resource within articles
  has_many :comments, dependent: :destroy#If you delete an article, its associated comments will also need to be deleted, otherwise they would simply occupy space in the database. Rails allows you to use the dependent option of an association to achieve this.
  validates :title, presence: true,
            length: { minimum: 5 }
end
