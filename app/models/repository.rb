class Repository < Fenix::Store::Repository
  def self.find_or_create_several(list)
    list.map{|s| self.find_or_create_by(url: s['url'], installer: s['installer']).id}
  end
end
