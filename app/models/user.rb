class User < ApplicationRecord
  def show_tests(level)
    Test.joins('JOIN results ON results.test_id = tests.id')
    .where("level = ? AND results.user_id = ?", level, id)
  end
end
