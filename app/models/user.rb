class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :vegans, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_vegans, through: :likes, source: :vegan
  has_many :comments, dependent: :destroy
  def already_liked?(vegan)
    self.likes.exists?(vegan_id: vegan.id)
  end
end
        
