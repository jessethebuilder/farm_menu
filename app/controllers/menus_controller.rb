class MenusController < ApplicationController
  # include MenusControllerHelper
    # def self.included(klass)
    # klass.instance_eval do 
      before_action :set_menu, only: [:show, :edit, :update, :destroy]      
    # end
  # end
  
  def index
    set_menus_for_index
  end
  
  def show
    set_menu_for_show
  end
  
  def new
    @menu = Menu.new
    @menu.sections.build 
    @menu.sections.last.products.build
  end

  def edit
    @menu.sections.build
    @menu.sections.last.products.build
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to @menu, notice: 'Menu was successfully created.'
    else
      render :new
    end
  end

  def update
    if @menu.update(menu_params)
      redirect_to @menu, notice: 'Menu was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @menu.destroy
    redirect_to menus_url, notice: 'Menu was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def menu_params
      params.require(:menu).permit(:name, :description, :published,
                                   :sections_attributes => [:name, :description, :published, :order, :_destroy, :id,
                                                            :products_attributes => [:name, :description, :published, 
                                                                                     :order, :id, :_destroy, :price,
                                                                                     :available]])
    end
end