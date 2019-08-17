require "rails_helper"

RSpec.describe TimeLogsController, type: :controller do
  context "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_success
    end
  end

  context "GET #create" do
    it "returns a success response" do
      project = Project.first
      post :create, {
             "time_logs": [
               {
                 "description": "old entries 1",
                 "project_id": project.id,
                 "hours": 2,
               },
               {
                 "description": "old entries 2",
                 "project_id": project.id,
                 "hours": 30,
               },
             ],
           }
      expect(response).to be_success
    end
  end
end
