class Judgement < ApplicationRecord
  has_many :notifications
  validates :file_number, presence: true
  
end
