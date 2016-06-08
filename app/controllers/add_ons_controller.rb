class AddOnsController < ApplicationController
  before_action :set_add_on, only: [:show, :edit, :update, :destroy]

  # GET /add_ons
  def index
    @add_ons = AddOn.all
  end

  # GET /add_ons/1
  def show
  end

  # GET /add_ons/new
  def new
    @add_on = AddOn.new
  end

  # GET /add_ons/1/edit
  def edit
  end

  # POST /add_ons
  def create
    @add_on = AddOn.new(add_on_params)

    if @add_on.save
      redirect_to @add_on, notice: 'Add on was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /add_ons/1
  def update
    if @add_on.update(add_on_params)
      redirect_to @add_on, notice: 'Add on was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /add_ons/1
  def destroy
    @add_on.destroy
    redirect_to add_ons_url, notice: 'Add on was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_on
      @add_on = AddOn.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def add_on_params
      params.require(:add_on).permit(:name, :price, :published)
    end
end
