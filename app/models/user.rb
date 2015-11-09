class User < ActiveRecord::Base
  has_many :bookings
  has_many :schedules, :through => :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

end
