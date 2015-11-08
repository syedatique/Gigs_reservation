class Genre < ActiveRecord::Base
  has_many  :gigs
end
