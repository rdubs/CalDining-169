require 'rails_helper'

RSpec.describe Image, type: :model do
  it "knows all meals of the day" do
    item = Item.create(name:"Test Passer")
    image = Image.create(filename:"test_passer.png", state: 1)
    item.images << image
    item.save
    item.reload
    expect(Image.get_first_image(item)).to eq("test_passer.png")
  end
end
