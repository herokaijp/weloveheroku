require 'spec_helper'
describe SitesController do
  resources_should_routes 'sites', [:new, :create]
end