class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:upload_picture]

  # GET /items/1
  # GET /items/1.json
  def show
    @meal = params[:meal]
    @location = params[:location]
    @menu_id = Menu.where(:meal => @meal, :location => @location).first.id
    item = Item.where(:id => params[:id]).first
    @other_locations = item.menus.where(:meal => @meal).reject {|menu|  menu.location == @location}
  end

  def upload_picture
    uploaded_io = params[:picture]
    extension = File.extname(uploaded_io.original_filename)
    item = Item.where(:id => params[:id]).first
    filename = item.id.to_s + "_" + (item.images.length + 1).to_s + extension
    new_img = Image.new(:filename => filename, :state => 0, :item => item, :user => current_user)
    new_img.save
    File.open(Rails.root.join('app', 'user_uploads', filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    redirect_to menus_path
  end

  def serve_first_image
    item = Item.find(params[:id])
    image_path = Image.get_first_image(item)
    send_file(image_path,
      :disposition => 'inline',
      :type => 'image/jpeg',
      :x_sendfile => true)
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
