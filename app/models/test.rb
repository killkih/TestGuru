class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.tests_of_category(category_name)
    joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: {title: category_name})
    .order(id: :DESC)
    .pluck(:title)
  end
end
