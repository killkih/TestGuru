class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_number_of_questions, on: :update

  private

  def validate_number_of_questions
    errors.add(:base, 'Minimum one answer and maximum four') if answers.size > 4 || answers.empty?
  end
end
