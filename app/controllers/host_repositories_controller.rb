class HostRepositoriesController < ApplicationController
  before_action :set_host_repository, only: [:show, :edit, :update, :destroy]

  # GET /host_repositories
  # GET /host_repositories.json
  def index
    @host_repositories = HostRepository.all
  end

  # GET /host_repositories/1
  # GET /host_repositories/1.json
  def show
  end

  # GET /host_repositories/new
  def new
    @host_repository = HostRepository.new
  end

  # GET /host_repositories/1/edit
  def edit
  end

  # POST /host_repositories
  # POST /host_repositories.json
  def create
    @host_repository = HostRepository.new(host_repository_params)

    respond_to do |format|
      if @host_repository.save
        format.html { redirect_to @host_repository, notice: 'Host repository was successfully created.' }
        format.json { render :show, status: :created, location: @host_repository }
      else
        format.html { render :new }
        format.json { render json: @host_repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /host_repositories/1
  # PATCH/PUT /host_repositories/1.json
  def update
    respond_to do |format|
      if @host_repository.update(host_repository_params)
        format.html { redirect_to @host_repository, notice: 'Host repository was successfully updated.' }
        format.json { render :show, status: :ok, location: @host_repository }
      else
        format.html { render :edit }
        format.json { render json: @host_repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /host_repositories/1
  # DELETE /host_repositories/1.json
  def destroy
    @host_repository.destroy
    respond_to do |format|
      format.html { redirect_to host_repositories_url, notice: 'Host repository was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host_repository
      @host_repository = HostRepository.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def host_repository_params
      params.require(:host_repository).permit(:host_id, :repository_id, :active)
    end
end
