class ApplicationController < ActionController::Base
  before_action :set_i18n_locale
  protect_from_forgery with: :exception

  def set_i18n_locale
    I18n.locale = :fr
  end
end
