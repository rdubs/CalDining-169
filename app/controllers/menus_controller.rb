class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @meals = Menu.meals
    @locations = Menu.locations
    @menus = Menu.all
    
    #@selected_meal = ""
    @selected_location = ""

    #session.clear
    if params[:meal] && params[:location]
      #session[:selected_meal] = params[:meal]
      #session[:selected_location] = params[:location]
      @selected_meal = params[:meal]
      @selected_location = params[:location]
    #elsif session[:selected_meal] && session[:selected_location]
      #@selected_meal = session[:selected_meal]
      #@selected_location = session[:selected_location]
    end

    if @selected_meal and @selected_location
      menu = Menu.where(:meal => @selected_meal, :location => @selected_location).first
      if not menu.nil?
        id = menu.id
        redirect_to menu_path(id) and return
      end
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    menu = Menu.where(id: params[:id]).first
    #we have access to meal
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
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
