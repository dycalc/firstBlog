class Post < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true
  validates :title, :presence => true

  has_many :comments
end
