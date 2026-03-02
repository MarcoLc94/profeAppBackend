class Attendance < ApplicationRecord
  belongs_to :group
  has_many :attendance_records, dependent: :destroy
end
