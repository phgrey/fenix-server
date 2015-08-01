class Host::BaseController < ApplicationController
  before_action :host_find

  protected

  def host_find
    @host = Host.find(params[:host_id])
  end


end
