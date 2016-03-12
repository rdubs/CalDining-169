require 'rails_helper'

RSpec.describe Menu, type: :model do
  it "knows all meals of the day" do
    expect(Menu.meals).to eq(['Breakfast', 'Lunch/Brunch', 'Dinner'])
  end
  
  it "knows all dining locations" do
    expect(Menu.locations).to eq(['Crossroads', 'Cafe 3', 'Foothill', 'Clark Kerr'])
  end
end
