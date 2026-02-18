class ApplicationController < ActionController::Base
  layout :mylayout
  protect_from_forgery with: :exception, prepend: true
  skip_before_action :verify_authenticity_token
  before_action :backgroundimage
#
# before_action :configure_permitted_parameters, if: :devise_controller?
before_action :configure_permitted_parameters, if: :devise_controller?
before_action :sailors
around_action :switch_locale
around_action :switch_locale

def switch_locale(&action)
  locale = params[:locale] || extract_locale_from_tld || I18n.default_locale
  I18n.with_locale(locale, &action)
end

# Get locale from top-level domain or return +nil+ if such locale is not available
# You have to put something like:
#   127.0.0.1 application.com
#   127.0.0.1 application.it
#   127.0.0.1 application.pl
# in your /etc/hosts file to try this out locally
def extract_locale_from_tld
  parsed_locale = request.host.split('.').last
  I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
end
def sailors
@localevalue="en"
if params[:mode] && user_signed_in?
  current_user.mode = params[:mode]
  current_user.save
end
end
  def backgroundimage
@background=Backgroundimage.find_or_initialize_by(url: request.path)
  end
  private
  def mylayout
    if params[:withoutlayout] == "true"
      false
    else
      "application"
    end
  end
  def microphoneyes
    @microphoneyes = session[:microphoneyes]
        @colonnes = {11=>"add people",12=>"as if you sent an email",8=>"Meaning words",2=>"search people",3=>"selected people",10=>"add places",4=>"tasks",6=>"Hacking the sailors",5=>"add video / audio / photo",7=>"Add a metonymy",1=>"synonyms",9=>"anaphors",8=>"what you would do"}

  end
  def changeuserid
    session[:changeuserid]
  end
  def recipients
      Person.where(id: session[:recipients])
  end

  def displayrecipients
    session[:displayrecipients]
  end

  protected

    def configure_permitted_parameters
	#newparams=params[:user]&&params[:user][:photos] ? params.require(:user).permit(:photos) : nil
     if params["cuisine.x"] && params["cuisine.x"] != "0"
      devise_parameter_sanitizer.permit(:account_update, keys:[:musicalinstrument_id,:city_id,:job_id,:cuisinier])
     elsif params["menage.x"] && params["menage.x"] != "0"
      devise_parameter_sanitizer.permit(:account_update, keys:[:musicalinstrument_id,:city_id,:job_id,:ordures])
     elsif params["sydney.x"] && params["sydney.x"] != "0"
      devise_parameter_sanitizer.permit(:sign_up, keys: [:musicalinstrument_id,:city_id,:job_id,:contentmeuf1,:contentmec1,:nbdoubles, :name, :"sydney.x",:image=>{},:aliases_attributes=>{},:photos=>[],:alias_ids=>[],:meuf1=>[],:mec1=>[]])
      devise_parameter_sanitizer.permit(:sign_in, keys:[:musicalinstrument_id,:city_id,:job_id,:contentmeuf1,:contentmec1,:nbdoubles,:"sydney.x",:email,:password,:aliases_attributes=>{},:photos=>[],:alias_ids=>[],:meuf1=>[],:mec1=>[]])
      devise_parameter_sanitizer.permit(:account_update, keys:[:musicalinstrument_id,:city_id,:job_id,:contentmeuf1,:contentmec1,:nbdoubles,:"sydney.x", :name, :image,:aliases_attributes=>{},:photos=>[],:alias_ids=>[],:meuf1=>[],:mec1=>[]])
else
      devise_parameter_sanitizer.permit(:sign_up, keys: [:musicalinstrument_id,:city_id,:job_id,:contentmeuf1,:contentmec1, :name,:image=>{},:photos=>[],:meuf1=>[],:mec1=>[]])
      devise_parameter_sanitizer.permit(:sign_in, keys:[:musicalinstrument_id,:city_id,:job_id,:contentmeuf1,:contentmec1,:email,:password,:photos=>[],:meuf1=>[],:mec1=>[]])
      devise_parameter_sanitizer.permit(:account_update, keys:[:musicalinstrument_id,:city_id,:job_id,:contentmeuf1,:contentmec1,:name, :image,:photos=>[],:meuf1=>[],:mec1=>[]])
end
          p params
      p devise_parameter_sanitizer
p request.query_parameters
p params
    end
     def after_sign_up_path_for(resource)
   new_user_session_path(resource)
 end

#def configure_permitted_parameters
#  p devise_parameter_sanitizer
#    devise_parameter_sanitizer.permit(:account_update) 
#    devise_parameter_sanitizer.permit(:account_update)
#    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password,:password_confirmation, :name, :image) }
#end
end
