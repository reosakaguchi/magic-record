class Article < ApplicationRecord
  belongs_to :user
  has_many :remarks, dependent: :destroy
  
  attachment :article_image
  
  with_options presence: true do
    validates :title, length: { maximum: 20 }
    validates :body
  end
  
  enum article_status: { information: 0, learning: 1, qanda: 2}
end
