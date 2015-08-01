class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :title
      t.hstore :params

      t.timestamps null: false
    end
  end
end
