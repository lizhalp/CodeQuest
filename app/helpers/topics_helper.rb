module TopicsHelper
  def completion_checkbox_value(content)
    if Current.user.completed_content?(content)
      "checked"
    else
      ""
    end
  end
end
