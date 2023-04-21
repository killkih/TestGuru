class GistsController < ApplicationController

  def create
    @test_passage = TestPassage.find(params[:id])

    result = GistQuestionService.new(@test_passage.current_question).call

    gist = current_user.gists.new(question: @test_passage.current_question, url: result.html_url)

    if result.url.present?
      gist.save
      flash_options = { notice: t('gist.success_html', url: result.html_url).html_safe }
    else
      flash_options = { alert: t('gist.failure') }
    end

    redirect_to @test_passage, flash_options
  end

end
