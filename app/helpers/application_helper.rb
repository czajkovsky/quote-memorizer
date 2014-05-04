module ApplicationHelper

  def active_menu(controller, action = nil)
    'active' if controller_name == controller and (action.nil? or action_name == action)
  end
end
