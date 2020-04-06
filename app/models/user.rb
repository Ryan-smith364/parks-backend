class User < ApplicationRecord
  has_many :users_parks
  has_many :parks, :through => :users_parks

  validates :username, :uniqueness => {:case_sensitive => false}

end
