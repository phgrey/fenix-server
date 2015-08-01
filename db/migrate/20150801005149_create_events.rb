class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :comment
      t.references :host, index: true, foreign_key: true
      t.string :installer, limit: 10
      t.hstore :params
      t.timestamps null: false
    end
  end
end
