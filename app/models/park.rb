class Park < ApplicationRecord
  has_many :users_parks
  has_many :users, :through => :users_parks                                                                                                                                                                                                                                                                                                                  

end
