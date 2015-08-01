class Host::EventsController < Host::BaseController
  before_action :set_event, only: [:show, :edit, :update]

  # GET /events
  # GET /events.json
  def index
    params[:offset] = 0 unless params.has_key? :offset
    #TODO optimize with revert indexes at least
    @events = @host.events.offset(params[:offset]).limit(100).order('id DESC')
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    data = params[:event]
    @event = Event.new Flattener.event data

    saved = Install.install Flattener.installs(data), @host, @event

    respond_to do |format|
      if saved
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update Flattener.event params[:event]
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.



end
