class CreateInstalls < ActiveRecord::Migration
  def change
    create_table :installs do |t|
      t.references :host, index: true, foreign_key: true
      t.references :package, index: true, foreign_key: true
      t.references :repository, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.string :title, index: true
      t.string :installer
      t.boolean :removed
      t.hstore :params
      t.timestamps null: false
    end

  end
end
