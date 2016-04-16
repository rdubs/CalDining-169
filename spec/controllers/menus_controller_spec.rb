require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  describe "GET #index" do
    before do
      get :index
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "should have the right instance variables" do
      expect(assigns(:meals)).to match_array(['Breakfast', 'Lunch/Brunch', 'Dinner'])
      expect(assigns(:locations)).to match_array(['Crossroads', 'Cafe 3', 'Foothill', 'Clark Kerr'])
    end

    it "should have the current menu location" do
      expect(assigns(:selected_meal)).to eq nil
      expect(assigns(:selected_location)).to eq nil
    end

    it "should update the selected meal and location" do
      get :index, :meal => "Dinner", :location => "Crossroads"
      expect(controller.params[:meal]).to eq "Dinner"
      expect(controller.params[:location]).to eq"Crossroads"
      expect(assigns(:selected_meal)).to eq "Dinner"
      expect(assigns(:selected_location)).to eq "Crossroads"
    end
  end

  describe "GET #SHOW" do
    before do
      get :show, :id => 1
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end
  end
end
