class CreateHostRepositories < ActiveRecord::Migration
  def change
    create_table :host_repositories do |t|
      t.references :host, index: true, foreign_key: true
      t.references :repository, index: true, foreign_key: true
      t.boolean :active

      t.timestamps null: false
    end
  end
end
