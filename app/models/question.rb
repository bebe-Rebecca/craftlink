class Question < ApplicationRecord
  belongs_to :user
  belongs_to :job

  validates :name,    presence: true
  validates :title,   presence: true
  validates :content, presence: true
end
