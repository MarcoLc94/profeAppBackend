class User < ApplicationRecord
  has_one :login, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
