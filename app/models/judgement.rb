class Judgement < ApplicationRecord
  has_many :notifications, dependent: :destroy
  accepts_nested_attributes_for :notifications, allow_destroy: true
  validates :file_number, presence: true
  
end
