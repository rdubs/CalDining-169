# require_relative "../dining_web_parser"

class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @meals = Menu.meals
    @locations = Menu.locations
    @menus = Menu.all
    params[:meal] ? @selected_meal = params[:meal] : @selected_meal = session[:selected_meal]
    params[:location] ? @selected_location = params[:location] : @selected_location = session[:selected_location]
    @current_items = []
    if current_user
      @menus.each do |menu|
        @current_items.push(menu.items.select{ |item| item.users.include? (current_user)}.flatten)
      end
    end
    if params[:meal] and params[:location]
      session[:selected_meal] = params[:meal]
      session[:selected_location] = params[:location]
      menu = Menu.where(:meal => params[:meal], :location => params[:location]).first
      if not menu.nil?
        redirect_to menu_path(menu.id) and return
      end
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @meals = Menu.meals
    @locations = Menu.locations
    @menu = Menu.where(id: params[:id]).first
    @selected_meal = @menu.meal
    @selected_location = @menu.location
    if current_user
      @items = @menu.items.sort_by{ |obj| obj.updated_at }.partition{ |item| item.users.include? (current_user)}.flatten
    else
      @items = @menu.items.sort_by{ |obj| obj.updated_at }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:meal, :location)
    end
end
