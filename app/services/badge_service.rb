class BadgeService
  CONDITIONS = {
    first_try: Badges::FirstTryConditionSpecification,
    passed_category: Badges::PassedCategoryConditionSpecification,
    passed_level: Badges::PassedLevelConditionSpecification
  }.freeze


  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.find_each do |badge|
      condition = CONDITIONS[badge.condition.to_sym].new(@test_passage, badge.option)
      give_achievement(badge) if condition.satisfies?
    end
  end

  private

  def give_achievement(badge)
    @user.badges << badge
  end
end
