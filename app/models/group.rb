class Group < ApplicationRecord
  belongs_to :user
  has_many :students, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :attendances, dependent: :destroy
end
