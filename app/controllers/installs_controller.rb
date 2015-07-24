class InstallsController < ApplicationController
  before_action :set_install, only: [:show, :edit, :update, :destroy]

  # GET /installs
  # GET /installs.json
  def index
    @installs = Install.all
  end

  # GET /installs/1
  # GET /installs/1.json
  def show
  end

  # GET /installs/new
  def new
    @install = Install.new
  end

  # GET /installs/1/edit
  def edit
  end

  # POST /installs
  # POST /installs.json
  def create
    @install = Install.new(install_params)

    respond_to do |format|
      if @install.save
        format.html { redirect_to @install, notice: 'Install was successfully created.' }
        format.json { render :show, status: :created, location: @install }
      else
        format.html { render :new }
        format.json { render json: @install.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /installs/1
  # PATCH/PUT /installs/1.json
  def update
    respond_to do |format|
      if @install.update(install_params)
        format.html { redirect_to @install, notice: 'Install was successfully updated.' }
        format.json { render :show, status: :ok, location: @install }
      else
        format.html { render :edit }
        format.json { render json: @install.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /installs/1
  # DELETE /installs/1.json
  def destroy
    @install.destroy
    respond_to do |format|
      format.html { redirect_to installs_url, notice: 'Install was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_install
      @install = Install.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def install_params
      params.require(:install).permit(:host_id, :package, :installed_at, :uninstalled_at)
    end
end
