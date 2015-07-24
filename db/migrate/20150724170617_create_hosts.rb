class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :hash
      t.hstore :params
      t.timestamps null: false
    end
    add_index :hosts, :hash, unique: true
  end
end
