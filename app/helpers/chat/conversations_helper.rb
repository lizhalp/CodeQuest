# frozen_string_literal: true

module Chat
  module ConversationsHelper
    # Return a gray circle if the user is offline,
    # a green circle if the user is online,
    def active_status_icon(user)
      if user.online?
        content_tag(:span, "", class: "active-status-icon")
      else
        content_tag(:span, "", class: "inactive-status-icon")
      end
    end
  end
end
