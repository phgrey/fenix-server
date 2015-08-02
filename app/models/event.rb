class Event < ActiveRecord::Base
  belongs_to :host
  has_many :packages
  #params: installs_count, type {install|snapshot}

end
