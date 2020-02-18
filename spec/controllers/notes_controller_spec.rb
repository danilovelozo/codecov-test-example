require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  let(:user) { double("user") }
  let(:project) { instance_double("Project", owner: user, id: "123") }
end
