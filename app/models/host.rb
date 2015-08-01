class Host < ActiveRecord::Base
  has_many :events
  has_many :sources
  has_many :installs
end
