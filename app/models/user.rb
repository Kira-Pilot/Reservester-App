class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :restaurants

  USER_ROLES = ["regular", "admin"]
  private_constant :USER_ROLES

  validates_inclusion_of :role, in: USER_ROLES

  def admin?
  	role == "admin"
  end
end

