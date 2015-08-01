class CreateInstallGroups < ActiveRecord::Migration
  def change
    create_table :install_groups do |t|
      t.string :comment
      t.references :host, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
