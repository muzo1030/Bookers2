class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, # ユーザー名は2~20文字
  			uniqueness: { case_sensitive: :false },
  			length: { minimum: 2, maximum: 20 }

  has_many :books  # 投稿と1:Nの関係性

  attachment :profile_image 

end