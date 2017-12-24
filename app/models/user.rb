class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, # ユーザー名は2~20文字、空白・重複は認めない
  			uniqueness: { case_sensitive: :false },
  			length: { minimum: 2, maximum: 20 },
  			presence: true

  validates :introduction, # 自己紹介文の長さは最大50文字
  			length: { maximum: 50 }

  has_many :books  # 投稿と1:Nの関係性

  attachment :profile_image

end