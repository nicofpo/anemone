# frozen_string_literal: true
module ApplicationHelper
  def inside?(controller, action)
    controller_path == controller && action == action_name
  end
end
