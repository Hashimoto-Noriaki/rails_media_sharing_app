class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 255 }
  # URI::MailTo::EMAIL_REGEXPは、RubyのライブラリのURIモジュールに定義されている正規表現。メールアドレスの形式を検証するために使用
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
end
