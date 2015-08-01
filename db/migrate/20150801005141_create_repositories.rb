class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :url, index:true
      t.string :installer
      t.hstore :params

      t.timestamps null: false
    end
    add_index :repositories, [:url, :installer], unique: true
  end
end
