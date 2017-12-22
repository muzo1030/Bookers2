class Book < ApplicationRecord

	belongs_to :user # ユーザーとN:1の関係性

end
