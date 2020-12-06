class TypesController < ApplicationController
  before_action :set_type, only: [:show, :update, :destroy]

  # GET /types
  def index
    @types = Type.all.order(:common_name)
    
    render json: @types
  end

  # GET /types/1
  def show
    if params[:info_panel] 
     count = params[:count].to_i
     puts "COUNT : #{count}"
     math_helper = count / 250 
     puts "MATHHELPER  #{math_helper}"
     math_helper = math_helper + 1
    puts "MATHHELPER *new* #{math_helper}"
      new_length = 250 * math_helper
      puts "NEW LENGTH #{new_length}"
      # puts new_length
      holder = @type.trees.first(new_length)
      output = holder[count..new_length]
      puts output.first[:name]
      puts output.last[:name]
      
      puts output.size
      # @type.trees do|x|
      #   puts x
      # end      
   
     render json: output
    else
        puts 'hohoho'
      render json: @type.trees.first(250)
    end
end
  # POST /types
  def create
    @type = Type.new(type_params)

    if @type.save
      render json: @type, status: :created, location: @type
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /types/1
  def update
    byebug
    if @type.update(type_params)
      render json: @type
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /types/1
  def destroy
    @type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])

    end

    # Only allow a trusted parameter "white list" through.
    def type_params
      params.require(:type).permit(:common_name, :botanical_name, :info_panel, :count)
    end
end
