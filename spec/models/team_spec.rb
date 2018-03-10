require 'rails_helper'

RSpec.describe Team, type: :model do
  it "has a valid factory" do
    expect(build(:team)).to be_valid
  end

  it { should belong_to(:account) }
  it { should have_many(:team_members).dependent(:destroy) }

end
