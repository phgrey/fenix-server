class Install < ActiveRecord::Base
  belongs_to :host
  belongs_to :package
  belongs_to :repository
  belongs_to :event

  def self.install installs, host, event=nil
    event.save unless event.nil? || event.saved?
    create(find_new(installs, host).map{|l|l+{host_id: host.id, event_id: event.id}})
    1
  end


  def self.find_new installs, host
    installs.each_slice(100).map{|list|
      list = Hash[[list.map{|l| [l['title'], l]}]]
      old_titles = host.installs.where({title: list.keys, removed:false}).pluck(:title)
      list = list.except(*old_titles).values if old_titles.count > 0
      list
    }.flatten
  end



end
