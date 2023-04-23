class Job < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :origin_to_prefecture

  validates :job_title,               presence: true
  validates :workshop_name,           presence: true
  validates :description,             presence: true
  validates :image,                   presence: true                  
  validates :origin_to_prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
end
