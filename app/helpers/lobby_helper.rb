# Helper methods defined here can be accessed in any controller or view in the application

Vaadbait::App.helpers do
  # def simple_helper_method
  #  ...
  # end
  def tag_icon(icon, tag = nil)
    content = content_tag(:i, '', :class=> "icon-#{icon.to_s}")
    content << " #{tag.to_s}"
  end

  def current_account
    Tenant.first
  end
end
