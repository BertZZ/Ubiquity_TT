class Upload < ApplicationRecord
  belongs_to :user

  validates :original_filename , presence: true
  validates :filename , presence: true
  validates :url , presence: true
end
