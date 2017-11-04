class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_locale, :find_categories

  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale 
    end

    def find_categories
      @categories = Category.grouped_data
    end
end
