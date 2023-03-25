module QuestionsHelper

  def question_header(question)
    if question.persisted?
      'Edit question'
    else
      'Create question'
    end
  end
end
