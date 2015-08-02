class CreateHosts < ActiveRecord::Migration
  def up
    create_table :hosts do |t|
      t.string :key
      t.string :title
      t.hstore :params
      t.timestamps null: false
    end

    # random id solution - taken from http://stackoverflow.com/questions/20890129/postgresql-random-primary-key

  end

  def down
    drop_table :hosts
    Host.connection.execute("DROP FUNCTION IF EXISTS pseudo_encrypt(bigint);")
    # Host.connection.execute("ALTER TABLE hosts ALTER COLUMN id SET DEFAULT nextval('hosts_id_seq');")
  end
end
