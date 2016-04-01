# require_relative "../dining_web_parser"

class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @meals = Menu.meals
    @locations = Menu.locations
    @menus = Menu.all
    params[:meal] ? @selected_meal = params[:meal] : @selected_meal = ""
    params[:location] ? @selected_location = params[:location] : @selected_location = ""
    #session.clear
    # if params[:meal] && params[:location]
    #   #session[:selected_meal] = params[:meal]
    #   #session[:selected_location] = params[:location]
    #   @selected_meal = params[:meal]
    #   @selected_location = params[:location]
    # #elsif session[:selected_meal] && session[:selected_location]
    #   #@selected_meal = session[:selected_meal]
    #   #@selected_location = session[:selected_location]
    # end

    if @selected_meal and @selected_location
      menu = Menu.where(:meal => @selected_meal, :location => @selected_location).first
      if not menu.nil?
        redirect_to menu_path(menu.id) and return
      end
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @menu = Menu.where(id: params[:id]).first
    @items = @menu.items
    #we have access to meal
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
