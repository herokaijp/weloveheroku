require 'spec_helper'
describe SitesController do
  resources_should_routes 'sites', [:new, :create, :index, :show]
  describe 'routing /' do
    it 'routes to #index' do
      get('/').should route_to('sites#index')
    end
  end
end
