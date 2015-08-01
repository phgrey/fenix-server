class StatusController < ApplicationController
  def index
    data = {
      time: Time.new().inspect,
      counts:{
        hosts: Host.count
      }
    }
    render json: data
  end
end
