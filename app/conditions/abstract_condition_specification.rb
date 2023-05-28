# frozen_string_literal: true

class AbstractConditionSpecification

  def initialize(test_passage, option)
    @test_passage = test_passage
    @option = option
    @user = test_passage.user
  end

  def satisfies?
    raise "#{__method__} undefined for #{self.class}"
  end

end
