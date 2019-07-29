class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  default_scope {order(created_at: :asc)}

  has_many :projects

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :role
end
