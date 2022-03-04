class Remark < ApplicationRecord
  belongs_to :user
  belongs_to :article

  
  with_options presence: true do
    validates :remark, length: { maximum: 20 }

  end
end
