class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :viewings
         has_many :gigs, through: :viewings


  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

end
