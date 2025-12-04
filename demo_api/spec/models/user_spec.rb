require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name" do
    user = User.new(name: "Joy")
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil)
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end
end
