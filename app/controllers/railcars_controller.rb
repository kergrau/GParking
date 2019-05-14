class RailcarsController < ApplicationController
  before_action :set_railcar, only: [:show, :edit, :update, :destroy]

  # GET /railcars
  # GET /railcars.json
  def index
    @railcars = Railcar.all
  end

  # GET /railcars/1
  # GET /railcars/1.json
  def show
  end

  # GET /railcars/new
  def new
    @railcar = Railcar.new
  end

  # GET /railcars/1/edit
  def edit
  end

  # POST /railcars
  # POST /railcars.json
  def create
    @railcar = Railcar.new(railcar_params)
    #people_id = Person.select(Person.arel_table[:id]).
    #where(Person.arel_table[:dni].eq(@railcar.people_id))
    #if people_id.blank?
    #  @railcar.people_id =''
    #else
    #  @railcar.people_id = people_id[0]['id']
    #end

    respond_to do |format|
      if @railcar.save
        format.html { redirect_to @railcar, notice: 'Railcar was successfully created.' }
        format.json { render :show, status: :created, location: @railcar }
      else
        format.html { render :new }
        format.json { render json: @railcar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /railcars/1
  # PATCH/PUT /railcars/1.json
  def update
    respond_to do |format|
      if @railcar.update(railcar_params)
        format.html { redirect_to @railcar, notice: 'Railcar was successfully updated.' }
        format.json { render :show, status: :ok, location: @railcar }
      else
        format.html { render :edit }
        format.json { render json: @railcar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /railcars/1
  # DELETE /railcars/1.json
  def destroy
    @railcar.destroy
    respond_to do |format|
      format.html { redirect_to railcars_url, notice: 'Railcar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_railcar
      @railcar = Railcar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def railcar_params
      params.require(:railcar).permit(:people_id, :placa, :marca, :modelo, :tipo)
    end
end
