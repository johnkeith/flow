require 'rails_helper'

RSpec.describe Survey, type: :model do
  it "has a valid factory" do
    expect(build(:survey)).to be_valid
  end

  it { should belong_to(:admin) }
  it { should belong_to(:account) }
  it { should have_many(:survey_responses).dependent(:destroy) }
  it { should have_many(:team_members).through(:survey_responses) }

end
