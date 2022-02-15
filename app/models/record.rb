class Record < ApplicationRecord
  belongs_to :user
  
  with_options presence: true do
    validates :magic_name
    validates :body
  end
  
  enum time_status: { less_than_one: 0, one_to_three: 1, three_to_ten: 2, ten_or_more:3 }
  enum audience_status: { family: 0, friend: 1, acquaintance: 2}

end
