class Remark < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :remark, presence: true, length: { maximum: 85 }
end
