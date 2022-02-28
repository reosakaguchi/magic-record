class Record < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :magic_name, length: { maximum: 25 }
    validates :body
  end
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  enum time_status: { less_than_one: 0, one_to_three: 1, three_to_ten: 2, ten_or_more:3 }
  enum audience_status: { family: 0, friend: 1, acquaintance: 2}

end
