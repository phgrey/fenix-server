class Source < ActiveRecord::Base
  belongs_to :host
  belongs_to :repository

  def self.new
    super
    seen_at = Time.now if seen_at.nil?
    self
  end

end
