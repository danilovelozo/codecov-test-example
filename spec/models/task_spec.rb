require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:project) { FactoryBot.create(:project) }

  it "is valid with a project and name" do
    task = Task.new(
      project: project,
      name: "Test task",
    )
    expect(task).to be_valid
  end
end
