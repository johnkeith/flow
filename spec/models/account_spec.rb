require 'rails_helper'

RSpec.describe Account, type: :model do
  it "has a valid factory" do
    expect(build(:account)).to be_valid
  end

  it { should have_many(:admins) }
  it { should have_many(:surveys) }
  it { should have_many(:teams) }

end
