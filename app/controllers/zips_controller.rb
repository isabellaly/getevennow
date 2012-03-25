class ZipsController < ApplicationController
  # GET /zips
  # GET /zips.json
  def index
    
    searchterm = "#{params[:term]}".upcase
    @zips = Zip.order(:locationtext).where("zipcode like ? OR upper(locationtext) like ?", "#{searchterm}%", "%#{searchterm}%").limit(15)
    render json: @zips.map{|z| {label: z.locationtext + ' - ' + z.zipcode, value: z.zipcode}}
    
  end

 
end
