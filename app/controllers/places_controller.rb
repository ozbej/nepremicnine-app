class PlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place, only: [:show, :edit, :update, :destroy]

    # GET /place
  # GET /place.json
  def index
    @place = Place.all
  end

  # GET /place/1
  # GET /place/1.json
  def show
  end

  # GET /place/new
  def new
    @place = Place.new
  end

  # GET /place/1/edit
  def edit
  end

  # POST /place
  # POST /place.json
  def create
    #@place = Place.new(place_params)
    
    #zgoraj je orginal
    #da ustvarimo povezavo, bo sedaj user ustvaril destinacijo in se bo zato shranil njegov tuji ključ
    #v spremenljivki current_user je objekt trenutno prijavljenega uporabnika
    @place = current_user.place.build(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /place/1
  # PATCH/PUT /place/1.json
  def update
    #opcijsko, če že imate vnešene kakšne destinacije, preden ste uredili prijavo in povezavo z uporabnikom
    #potem bi ob vsakem urejanju se pod uporabnika vpisal uporabnik, ki trenutno ureja destinacijo
    @place.user = current_user
    
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /place/1
  # DELETE /place/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to place_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:ime, :opis, :lokacija, :kraj)
    end
end



