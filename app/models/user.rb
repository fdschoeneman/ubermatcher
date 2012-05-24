class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, 
         :validatable, :omniauthable, :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
  				:name, :confirmed_at
end
