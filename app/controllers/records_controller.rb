class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @records = Record.where(estado: true)
  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
  def new
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
=begin
      Debes asociar las clases en rails para ahorrarte la empanada que estas
      haciendo con esta consulta que rails te la ahorra cuando asocias el
      asunto. De uno a muchos Persons -> Railscars y Railscars -> Records.
=end
    @record = Record.new(record_params)
    railcars_id = Railcar.select([Railcar.arel_table[:id],
    Railcar.arel_table[:tipo]]).
    where(Railcar.arel_table[:placa].eq(@record.railcars_id))

    if railcars_id.blank?
      @record.railcars_id =''
    else
      @record.railcars_id = railcars_id[0]['id']
    end

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def prueba
    #Esta es la consulta que me permte traer los precios.
      @consulta = Record.connection.select_all(
        "SELECT prices.valor, prices.hora_inicio, prices.hora_fin
         FROM prices
         WHERE prices.estado = true AND prices.tipo_carro = (
           SELECT railcars.tipo
    	     FROM railcars INNER JOIN records ON railcars.id = records.railcars_id
    	     WHERE records.id = 10)").to_hash

     tiempo_facturar = (@record.horafinal - @record.created_at) / 60
     sum_precio = 0

     #Esta es la parte ddonde recorro los registros de precios y voy sumando
     @consulta.each do |con|
       if con.first
         minutos = (con.hora_fin - @record.created_at) / 60
       elsif con.last
         minutos = (@record.horafinal - con.hora_inicio) / 60
       else
         minutos = (con.hora_fin - con.hora_inicio) / 60
       end
       @sum_precio = @sum_precio + minutos * con.valor
       tiempo_facturar = tiempo_facturar - minutos
     end

       if tiempo_facturar > 0
         @sum_precio = tiempo_facturar * 100 + @sum_precio
       end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:railcars_id, :horafinal, :estado)
    end
end
