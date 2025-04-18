class User < ApplicationRecord
  has_one_attached :avatar
  has_many :predictions, dependent: :destroy
  belongs_to :user_group, optional: true

  def grouped?
    user_group.present?
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def rank
   User.where("score > ?", self.score || 0).count + 1
  end
end
