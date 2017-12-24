class Book < ApplicationRecord

	belongs_to :user # ユーザーとN:1の関係性

	validates :body, # 本の感想の本文は最大200文字、空白は認めない
  			length: { maximum: 200 },
  			presence: true

  	validates :title, # 本の題名の空白は認めない
  			presence: true

end
