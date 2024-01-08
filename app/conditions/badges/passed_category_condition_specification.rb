# frozen_string_literal: true

module Badges
  class PassedCategoryConditionSpecification < AbstractConditionSpecification

    def satisfies?
      return false unless @test_passage.test.category_id == @option.to_i

      tests = Test.where(category_id: @option.to_i).pluck(:id)
      passages = @user.successfully_passed_tests

      tests.sort == sort_by_category(passages, @option.to_i).pluck(:id).sort
    end

    def sort_by_category(tests, category_id)
       tests.select { |test| test.category_id == category_id }
    end
  end
end
