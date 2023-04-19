class GistsController < ApplicationController
  before_action :set_test_passage

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    gist = current_user.gists.new(question: @test_passage.current_question, url: result.html_url)

    if result.success?
      gist.save
      flash_options = { notice: t('gist.success', href: "<a href='#{result.html_url}' target='_blank'>view gist</a>") }
    else
      flash_options = { alert: t('gist.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
