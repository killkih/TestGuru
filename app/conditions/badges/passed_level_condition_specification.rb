# frozen_string_literal: true

module Badges
  class PassedLevelConditionSpecification < AbstractConditionSpecification

    def satisfies?
      return false unless @test_passage.test.level == @option.to_i

      tests = Test.where(level: @option.to_i).pluck(:id)
      passages = @user.successfully_passed_tests

      tests.sort == sort_by_level(passages, @option.to_i).pluck(:id).sort
    end

    def sort_by_level(tests, level)
      sorted_tests = tests.select { |test| test.level == level }
    end
  end
end
