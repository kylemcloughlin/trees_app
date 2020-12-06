class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :update, :destroy]

  # GET /locations
  def index

    if params[:autocomplete]
       params[:output] 
    @locations = Location.where("lower(name) LIKE lower(?)", "%#{params[:output]}%")
        
      
      render json: @locations
    else
      puts "TEST: #{Location.all.length()}!!!!!!!"
      @locations = Location.first(250)
      
      render json: @locations
    end
  end

  # GET /locations/1
    def show
if params[:info_panel]
 count = params[:count].to_i
math_helper = count / 250
math_helper = math_helper + 1
new_length = 250 * math_helper

holder = @location.trees.first(new_length)
output = holder[count..new_length]

render json: output
else
  puts "hohoho"
  render json: @location.trees.first(250)
  
end
  end

  # POST /locations
  def create
    @location = Location.new(location_params)

    if @location.save
      render json: @location, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/1
  def update

    if @location.update(location_params)
      render json: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      # byebug
      @location = Location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location).permit(:address,:name,:autocomplete,:output,:info_panel, :count)
    end
end
