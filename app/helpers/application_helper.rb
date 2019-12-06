module ApplicationHelper
  def notice_message messages, class_name
    content_tag(:ul, class: class_name) do
      messages.map do |message|
        content_tag(:li, message)
      end.join.html_safe
    end
  end

  def error_message error_messages
    notice_message(error_messages, "error_mess")
  end
end
