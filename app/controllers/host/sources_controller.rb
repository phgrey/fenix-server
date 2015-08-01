class Host::SourcesController < Host::BaseController
  # GET /sources/1
  # GET /sources/1.json
  def show

  end


  # GET /sources/1/edit
  def edit
  end



  # PATCH/PUT /sources/1
  # PATCH/PUT /sources/1.json
  def update
    respond_to do |format|
      if @source.update(host_repository_params)
        format.html { redirect_to source, notice: 'SourceList was successfully updated.' }
        format.json { render :show, status: :ok, location: source }
      else
        format.html { render :edit }
        format.json { render json: source.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host_repository
      @source = Source.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def host_repository_params
      params.require(:source).permit(:host_id, :repository_id, :active)
    end
end
