class Source < ActiveRecord::Base
  belongs_to :host
  belongs_to :repository

  # def self.new
  #   r = super
  #   r.seen_at = Time.now if r.seen_at.nil?
  #   r
  # end





end
