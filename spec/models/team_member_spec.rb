require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  it "has a valid factory" do
    expect(build(:team_member)).to be_valid
  end

  it { should belong_to(:team) }
  it { should belong_to(:account) }
  it { should have_many(:survey_responses) }
  it { should have_many(:surveys).through(:survey_responses) }
end
