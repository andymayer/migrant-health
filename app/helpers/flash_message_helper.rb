module FlashMessageHelper

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      message = replace_text(message)
      next unless message.is_a? String
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    flash[:error] = nil
    nil
  end

  private

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def replace_text(message)
    case message
    when "You are not authorised to new this question"
      return "You need to be <a href='/users/sign_in'>registered and logged in</a> to ask a question.".html_safe
    when "You are not authorised to new this comment"
      return "You need to be <a href='/users/sign_in'>registered and logged in</a> to post a comment.".html_safe
    when "You are not authorised to like this question"
      return "You need to be <a href='/users/sign_in'>registered and logged in</a> to vote on a question.".html_safe
    when "You are not authorised to like this answer"
      return "You need to be <a href='/users/sign_in'>registered and logged in</a> to vote on an answer.".html_safe
    else
      return message
    end
  end

end
