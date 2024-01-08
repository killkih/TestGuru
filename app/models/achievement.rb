class Achievement < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  def show_title
    badge.title
  end

  def show_picture
    badge.icon_url
  end
end
