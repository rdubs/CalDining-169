require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates an omniauth user" do
  faker = double('access_token', :info => {
    :uid => '12345',
    :info => {
      :name => 'facebookuser',
      :email => 'test@test.com'
    }})
    User.from_omniauth(faker)
  end
end
