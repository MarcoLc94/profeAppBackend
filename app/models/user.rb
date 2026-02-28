class User < ApplicationRecord
  has_one :login, dependent: :destroy
end
