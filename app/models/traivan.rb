class Traivan < ApplicationRecord
  has_secure_password

  validates :fullname, presence: true
  validates :username, format: {with: /@/, message: 'username not valid'}
  validates :password, presence: true
end
