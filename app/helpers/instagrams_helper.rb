module InstagramsHelper
    def new_or_edit_checkbox
      if action_name == 'new'
         false
      elsif action_name == 'edit'
         @taste.split(/\s*,\s*/).include?(taste)
      end
    end
end
