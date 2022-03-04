class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :profile_image
  
  has_many :records, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
  has_many :articles, dependent: :destroy
  has_many :remarks, dependent: :destroy
  
  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end
  
  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  validates :name, presence: true
  enum gender_status: { man: 0, woman: 1 }
end