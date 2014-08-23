class ZonesController < ApplicationController
  before_action :set_zone, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /zones
  # GET /zones.json
  def index
    @zones = Zone.all
  end

  # GET /zones/1
  # GET /zones/1.json
  def show
  end

  # GET /zones/new
  def new
    @zone = current_user.zones.build
  end

  # GET /zones/1/edit
  def edit
  end

 def create
    @zone = current_user.zones.build(zone_params)
    if @zone.save
      redirect_to @zone, notice: 'Zone was successfully created.'
    else
      render action: 'new'
    end
 end

def update
    if @zone.update(zone_params)
      redirect_to @zone, notice: 'Zone was successfully updated.'
    else
      render action: 'edit'
    end
end

def destroy
    @zone.destroy
    redirect_to zones_url
end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_zone
      @zone = Zone.find(params[:id])
    end

    def correct_user
      @zone = current_user.zones.find_by(id: params[:id])
      redirect_to zones_path, notice: "Not authorized to edit this zone" if @zone.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zone_params
      params.require(:zone).permit(:description, :image)
    end
end
