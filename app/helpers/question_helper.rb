module QuestionHelper


  def time_ago(question)
    if question.created_at == question.updated_at then
      "Added "+time_ago_in_words(question.created_at)
    else
      "Edited "+time_ago_in_words(question.created_at)
    end
  end

end
