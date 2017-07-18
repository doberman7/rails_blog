class Article < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }

  #This creates comments as a nested resource within articles
  has_many :comments
  validates :title, presence: true,
                                       length: { minimum: 5 }
end
