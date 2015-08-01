class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.references :host, index: true, foreign_key: true
      t.references :repository, index: true, foreign_key: true
      t.integer :unseen, default: 0
      t.timestamp :seen_at
      t.timestamps null: false
    end
    add_index :sources, [:host_id, :repository_id], unique: true
  end
end
