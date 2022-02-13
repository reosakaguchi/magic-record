class Record < ApplicationRecord
  belongs_to :user
  
  with_options presence: true do
    validates :magic_name
    validates :body
  end
  
  enum time: { less_than_one: 0, one_to_three: 1, three_to_ten: 2, ten_or_more:3 }, _prefix: true
  enum audience: { family: 0, friends: 1, acquaintances: 2}, _prefix: true

end
