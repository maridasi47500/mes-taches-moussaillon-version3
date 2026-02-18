module ApplicationHelper
def translated_model_name(i)
I18n.t("activerecord.model.#{i}",count:1)
end
  def resource
    user_signed_in? ? current_user : User.new
  end
  def resource_name
    :user
  end
  def resourcecomposer_name
    :composer
  end
  def resourcecomposer
    current_composer || Composer.new
  end

end
