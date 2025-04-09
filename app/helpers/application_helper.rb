
  module ApplicationHelper

    def form_button(action)
      case action
      when :edit
        'Update'
      when :new
        'Create'
      end
    end
  end
  

