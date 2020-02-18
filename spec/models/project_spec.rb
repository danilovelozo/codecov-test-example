require 'rails_helper'

RSpec.describe Project, type: :model do
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:user_id) }

  describe "late status" do
    it "is late when the due date is past today" do
      project = FactoryBot.create(:project, :due_yesterday)
      expect(project).to be_late
    end
  end

  it "can have many notes" do
    project = FactoryBot.create(:project, :with_notes)
    expect(project.notes.length).to eq 5
  end
end
