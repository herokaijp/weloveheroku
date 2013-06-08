class SitesController < ApplicationController
  def new
    @site = Site.new
  end
  
  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to site_path(@site), notice: '登録が完了しました'
    else
      render(:new)
    end
  end
  
  def show
    @site = Site.find(params[:id])
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
