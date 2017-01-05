class PackageFilesController < ApplicationController
  before_action :set_package_file, only: [:show, :edit, :update, :destroy]

  # GET /package_files
  # GET /package_files.json
  def index
    @package_files = PackageFile.all
  end

  # GET /package_files/1
  # GET /package_files/1.json
  def show
  end

  # GET /package_files/new
  def new
    @package_file = PackageFile.new
  end

  # GET /package_files/1/edit
  def edit
  end

  # POST /package_files
  # POST /package_files.json
  def create
    @package_file = PackageFile.new(package_file_params)

    respond_to do |format|
      if @package_file.save
        format.html { redirect_to @package_file, notice: 'Package file was successfully created.' }
        format.json { render :show, status: :created, location: @package_file }
      else
        format.html { render :new }
        format.json { render json: @package_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /package_files/1
  # PATCH/PUT /package_files/1.json
  def update
    respond_to do |format|
      if @package_file.update(package_file_params)
        format.html { redirect_to @package_file, notice: 'Package file was successfully updated.' }
        format.json { render :show, status: :ok, location: @package_file }
      else
        format.html { render :edit }
        format.json { render json: @package_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /package_files/1
  # DELETE /package_files/1.json
  def destroy
    @package_file.destroy
    respond_to do |format|
      format.html { redirect_to package_files_url, notice: 'Package file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package_file
      @package_file = PackageFile.find_by(path: params[:path])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_file_params
      params.require(:package_file).permit(:path, :content, :package_id)
    end
end
