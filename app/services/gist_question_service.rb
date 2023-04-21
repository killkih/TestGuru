class GistQuestionService
  attr_reader :client

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gists_params)
  end

  private

  def gists_params
    {
      description: I18n.t('gist.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def default_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
