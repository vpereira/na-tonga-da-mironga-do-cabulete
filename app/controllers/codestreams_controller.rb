class CodestreamsController < ApplicationController
  before_action :set_codestream, only: [:show, :edit, :update, :destroy]

  # GET /codestreams
  # GET /codestreams.json
  def index
    @codestreams = Codestream.all
  end

  # GET /codestreams/1
  # GET /codestreams/1.json
  def show
  end

  # GET /codestreams/new
  def new
    @codestream = Codestream.new
  end

  # GET /codestreams/1/edit
  def edit
  end

  # POST /codestreams
  # POST /codestreams.json
  def create
    @codestream = Codestream.new(codestream_params)

    respond_to do |format|
      if @codestream.save
        format.html { redirect_to @codestream, notice: 'Codestream was successfully created.' }
        format.json { render :show, status: :created, location: @codestream }
      else
        format.html { render :new }
        format.json { render json: @codestream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codestreams/1
  # PATCH/PUT /codestreams/1.json
  def update
    respond_to do |format|
      if @codestream.update(codestream_params)
        format.html { redirect_to @codestream, notice: 'Codestream was successfully updated.' }
        format.json { render :show, status: :ok, location: @codestream }
      else
        format.html { render :edit }
        format.json { render json: @codestream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codestreams/1
  # DELETE /codestreams/1.json
  def destroy
    @codestream.destroy
    respond_to do |format|
      format.html { redirect_to codestreams_url, notice: 'Codestream was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_codestream
      @codestream = Codestream.find_by(name: params[:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def codestream_params
      params.require(:codestream).permit(:name)
    end
end
