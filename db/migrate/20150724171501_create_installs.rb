class CreateInstalls < ActiveRecord::Migration
  def change
    create_table :installs do |t|
      t.references :host, index: true, foreign_key: true
      t.string :package
      t.timestamp :installed_at
      t.timestamp :uninstalled_at

      t.timestamps null: false
    end
    add_index :installs, :package
  end
end
