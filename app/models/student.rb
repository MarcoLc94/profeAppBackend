class Student < ApplicationRecord
  belongs_to :group
  has_many :grades, dependent: :destroy
  has_many :behavior_entries, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :attendance_records, dependent: :destroy
end
