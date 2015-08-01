class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :url
      t.string :type
      t.hstore :params

      t.timestamps null: false
    end
  end
end
