class SitesController < ApplicationController
  def new
    @site = Site.new
  end
end
