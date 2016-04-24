class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:upload_picture, :add_to_preferences, :remove_from_preferences]

  # GET /items/1
  # GET /items/1.json
  def show
    @meal = params[:meal]
    @location = params[:location]
    @menu_id = Menu.where(:meal => @meal, :location => @location).first.id
    @item = Item.where(:id => params[:id]).first
    @images = @item.images.where(state: 1)
    @other_locations = @item.menus.where(:meal => @meal).reject {|menu|  menu.location == @location}
  end

  def upload_picture
    item = Item.where(:id => params[:id]).first
    Image.new(:filename => params[:filename], :state => 0, :item => item, :user => current_user).save
    redirect_to :back
  end
  
  def add_to_preferences
    user = current_user
    item = Item.where(:id => params[:id]).first
    if not user.items.include? (item)
      if user.items.length < 10
        user.items << item
        user.save!
        user.reload
        item.reload
      else
        # some flash message
        flash[:error] = "You can have only 10 favorites"
      end
    end
    redirect_to :back
  end
  
  def remove_from_preferences
    user = current_user
    item = Item.where(:id => params[:id]).first
    if user.items.include? (item)
      user.items.delete(item)
      user.save!
      user.reload
      item.reload
    end
    redirect_to :back
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name)
    end
end
