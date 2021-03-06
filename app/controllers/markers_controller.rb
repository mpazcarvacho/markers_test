class MarkersController < ApplicationController
  before_action :set_marker, only: %i[ show edit update destroy ]

  # GET /markers or /markers.json
  def index
    @markers = Marker.all
    @categories = Category.all
    @marker_types = MarkerType.all
    @types = Type.all
  end

  # GET /markers/1 or /markers/1.json
  def show
  end

  # GET /markers/new
  def new
    @marker = Marker.new
  end

  # GET /markers/1/edit
  def edit
  end

  # POST /markers or /markers.json
  def create
    @marker = Marker.new(marker_params)
    @categories = Category.all

    unless @marker.save
      render json: @marker.errors, status: :unprocessable_entity
    end
    
    
    # render json: @instrument.to_json

    # respond_to do |format|
    #   # format.js {render layout: false}

    #   if @marker.save
    #     format.html { redirect_to marker_url(@marker), notice: "Marker was successfully created." }
    #     format.json { render :show, status: :created, location: @marker }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @marker.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /markers/1 or /markers/1.json
  def update
    @marker.update(marker_params)
    # respond_to do |format|
    #   if @marker.update(marker_params)
    #     format.html { redirect_to marker_url(@marker), notice: "Marker was successfully updated." }
    #     format.json { render :show, status: :ok, location: @marker }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @marker.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /markers/1 or /markers/1.json
  def destroy
    @marker.destroy

    # respond_to do |format|
    #   format.html { redirect_to markers_url, notice: "Marker was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marker
      @marker = Marker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def marker_params
      params.require(:marker).permit(:title, :url, category_markers_attributes: [ :id, :category_id, :_destroy], marker_types_attributes: [:id, :type_id, :_destroy] )
    end
end
