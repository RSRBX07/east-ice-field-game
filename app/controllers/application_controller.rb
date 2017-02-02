class ApplicationController < ActionController::Base
  before_action :set_i18n_locale
  protect_from_forgery with: :exception

  def set_i18n_locale
    I18n.locale = 'en'
  end

  def current_user
    User.last
  end
end
