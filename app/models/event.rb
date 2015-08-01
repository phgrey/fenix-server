class Event < ActiveRecord::Base
  belongs_to :host
  has_many :packages
end
