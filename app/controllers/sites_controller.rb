class SitesController < ApplicationController
  def new
    @site = Site.new
  end
  
  def create
    @site = Site.new(site_params)
    @site.save
  end
  
  private
  def site_params
    params.require(:site).permit(
      :name, :url, :description,
      :creator, :hash_tag, :repository_url,
      :please_design
    )
  end
  
end
