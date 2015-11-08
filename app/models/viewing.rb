class Viewing < ActiveRecord::Base

  belongs_to :gig
  belongs_to :user

  accepts_nested_attributes_for :user, :gig


end
