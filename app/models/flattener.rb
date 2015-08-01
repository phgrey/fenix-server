class Flattener
  class << self
    #params: installs_count,
    def event(data)
      _copy_fields(data, ['comment', 'installer', 'params'])
    end

    def installs(data)
      data['installs'].map{|i|_install i}
    end

    protected
    #params: repository_url, package_version, package_name, instead_of(title),
    def _install(data)
      _copy_fields data, ['title', 'removed', 'params', 'package_id', 'repository_id']
    end


    def _copy_fields(from, fields)
      Hash[fields.filter{|i|from.has_key?(i) && !from[i].nil?}.map{|i|[i, from[i]]}]
    end
  end
end