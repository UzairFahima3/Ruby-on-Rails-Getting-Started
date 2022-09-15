class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :articles, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  # validates :user_name, presence: true 
  has_one_attached :image, :dependent => :destroy 
end
