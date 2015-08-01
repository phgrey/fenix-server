class CreateInstalls < ActiveRecord::Migration
  def change
    create_table :installs do |t|
      t.references :host, index: true, foreign_key: true
      t.references :package, index: true, foreign_key: true
      t.references :repository, index: true, foreign_key: true
      t.references :install_group, index: true, foreign_key: true
      t.string :version
      t.string :title
      t.string :installer
      t.timestamp :installed_at
      t.timestamp :uninstalled_at
      t.hstore :params
      t.timestamps null: false
    end

  end
end
