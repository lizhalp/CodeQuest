module ApplicationHelper
  def navbar_active?(test_path)
    return "active" if request.path == test_path
    ""
  end
end
