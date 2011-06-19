class AutosController < ApplicationController
  before_filter :authenticate
  
  def index
    @autos = Auto.all
  end

  def show
    @auto = Auto.find(params[:id])
  end

  def new
    @auto = Auto.new
    2.times {@auto.assets.build}
  end

  def create
    @auto = Auto.new(params[:auto])
    if @auto.save
      redirect_to @auto, :notice => "Successfully created auto."
    else
      render :action => 'new'
    end
  end

  def edit
    @auto = Auto.find(params[:id])
    2.times {@auto.assets.build}
  end

  def update
    @auto = Auto.find(params[:id])
    if @auto.update_attributes(params[:auto])
      redirect_to @auto, :notice  => "Successfully updated auto."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @auto = Auto.find(params[:id])
    @auto.destroy
    redirect_to autos_url, :notice => "Successfully destroyed auto."
  end
  
  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "anemon" && password == "lotus"
    end
  end
  
  
  
end
