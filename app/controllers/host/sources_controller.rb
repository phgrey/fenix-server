class Host::SourcesController < Host::BaseController
  # GET /sources/1
  # GET /sources/1.json
  def show
    @sources = @host.sources().join(:repositories)
  end


  # GET /sources/1/edit
  def edit
  end



  # PATCH/PUT /sources/1
  # PATCH/PUT /sources/1.json
  def update
    sources = Flattener.sources params[:sources]
    respond_to do |format|
      if @host.set_sources sources
        format.html { redirect_to source, notice: 'SourceList was successfully updated.' }
        format.json { render :show, status: :ok, location: source }
      else
        format.html { render :edit }
        format.json { render json: source.errors, status: :unprocessable_entity }
      end
    end
  end



end
