class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def set_menus_for_index
    @menus = Menu.all
  end
  
  def set_menu_for_show
    @menu = Menu.find(params[:id])
  end
end
