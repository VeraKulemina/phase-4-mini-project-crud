class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
    # GET /birds
    def index
      spices = Spice.all
      render json: spices
    end
  
    # POST /birds
    def create
        spice = Spice.create(spice_params)
      render json: spice, status: :created
    end
  
  
    # PATCH /birds/:id
    def update
      spice = find_spice
      spice.update(spice_params)
      render json: spice
    end
  
  
    # DELETE /birds/:id
    def destroy
    spice = find_spice
    spice.destroy
    head :no_content
    end
  
    private
  
    def find_spice
      Spice.find(params[:id])
    end
  
    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end

    # t.string :title
    #   t.string :image
    #   t.string :description
    #   t.string :notes
    #   t.float :rating
  
    def render_not_found_response
      render json: { error: "Spice not found" }, status: :not_found
    end
  
  end