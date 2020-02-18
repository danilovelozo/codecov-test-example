require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  include_context "project setup"

  describe "#show" do
    it "responds with JSON formatted output" do
      sign_in user
      get :show, format: :json,
        params: { project_id: project.id, id: task.id }
      expect(response).to have_content_type :json
    end
  end
end
