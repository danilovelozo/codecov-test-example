require 'rails_helper'

describe 'Projects API', type: :request do
  it 'creates a project' do
    user = FactoryBot.create(:user)
    FactoryBot.create(:project, name: "Sample Project")
    FactoryBot.create(:project, name: "Second Sample Project", owner: user)

    project_attributes = FactoryBot.attributes_for(:project)

    expect {
      post api_projects_path, params: {
        user_email: user.email,
        user_token: user.authentication_token,
        project: project_attributes
      }
    }.to change(user.projects, :count).by(1)

    expect(response).to have_http_status(:success)
  end
end
