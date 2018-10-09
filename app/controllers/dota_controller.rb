class DotaController < ApplicationController
  before_action :set_dotum, only: [:show, :edit, :update, :destroy]

  # GET /dota
  # GET /dota.json
  def index
    @dota = Dotum.all
  end

  # GET /dota/1
  # GET /dota/1.json
  def show
  end

  # GET /dota/new
  def new
    @dotum = Dotum.new
  end

  # GET /dota/1/edit
  def edit
  end

  # POST /dota
  # POST /dota.json
  def create
    @dotum = Dotum.new(dotum_params)

    respond_to do |format|
      if @dotum.save
        format.html { redirect_to @dotum, notice: 'Dotum was successfully created.' }
        format.json { render :show, status: :created, location: @dotum }
      else
        format.html { render :new }
        format.json { render json: @dotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dota/1
  # PATCH/PUT /dota/1.json
  def update
    respond_to do |format|
      if @dotum.update(dotum_params)
        format.html { redirect_to @dotum, notice: 'Dotum was successfully updated.' }
        format.json { render :show, status: :ok, location: @dotum }
      else
        format.html { render :edit }
        format.json { render json: @dotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dota/1
  # DELETE /dota/1.json
  def destroy
    @dotum.destroy
    respond_to do |format|
      format.html { redirect_to dota_url, notice: 'Dotum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dotum
      @dotum = Dotum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dotum_params
      params.require(:dotum).permit(:name_version, :action, :ip_address, :port, :user, :pass, :name, :path)
    end
end
