class Badge < ApplicationRecord
  has_many :achievements, dependent: :delete_all
  has_many :users, through: :achievements

  validates :title, :icon_url, :condition, presence: true
end
