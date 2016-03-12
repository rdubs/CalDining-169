require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "GET #show" do
    it "should assign the meal and location instance variables" do
      get :show, {:id => 1, :meal => "Dinner", :location => "Cafe 3"}
      expect(assigns(:meal)).to eq "Dinner"
      expect(assigns(:location)).to eq "Cafe 3"
      expect(assigns(:menu_id)).to eq 9
    end
  end
end
