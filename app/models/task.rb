class Task < ApplicationRecord
  belongs_to :group
  has_many :grades, dependent: :destroy
end
