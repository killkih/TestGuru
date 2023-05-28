# frozen_string_literal: true
module Badges
  class FirstTryConditionSpecification < AbstractConditionSpecification

    def satisfies?
      return false unless test_passages = @user.test_passages.where(test_id: @test_passage.test_id)

      test_passages.count == 1 && test_passages[0].successful_passage?
    end
  end
end
