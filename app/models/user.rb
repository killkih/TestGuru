class User < ApplicationRecord
  #has_many :created_tests,

  has_many :results
  has_many :tests, through: :results

  def show_tests(level)
    tests.where(level: level)
  end
end
