class AchievementService
  def initialize(test_passage)
    @badges = []
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    select_conditions
    give_achievements
  end

  private

  def select_conditions
    @badges = Badge.all.select do |badge|
      send("#{badge.condition}?", badge.option)
    end
  end

  def give_achievements
    @user.badges.push(@badges)
  end

  def first_try?(*_option)
    return false unless test_passages = @user.test_passages.where(test_id: @test_passage.test_id)

    test_passages.count == 1 && test_passages[0].successful_passage?
  end

  def passed_category?(category_id)
    return false unless @test_passage.test.category_id == category_id.to_i

    tests = Test.where(category_id: category_id.to_i).pluck(:id)
    passages = @user.successfully_passed_tests

    tests.sort == sort_by_category(passages, category_id.to_i).pluck(:id).sort
  end

  def passed_level?(level)
    return false unless @test_passage.test.level == level.to_i

    tests = Test.where(level: level.to_i).pluck(:id)
    passages = @user.successfully_passed_tests

    tests.sort == sort_by_level(passages, level.to_i).pluck(:id).sort
  end

  def sort_by_category(tests, category_id)
    sorted_tests = tests.select { |test| test.category_id == category_id }
  end

  def sort_by_level(tests, level)
    sorted_tests = tests.select { |test| test.level == level }
  end
end
