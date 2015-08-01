class Install < ActiveRecord::Base
  belongs_to :host
  belongs_to :package
  belongs_to :repository
end
