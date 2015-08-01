class CreateHosts < ActiveRecord::Migration
  def up
    create_table :hosts do |t|
      t.string :key
      t.string :title
      t.hstore :params
      t.timestamps null: false
    end

    # random id solution - taken from http://stackoverflow.com/questions/20890129/postgresql-random-primary-key
    Host.connection.execute('CREATE OR REPLACE FUNCTION pseudo_encrypt(VALUE bigint) returns bigint AS $$
DECLARE
l1 int;
l2 int;
r1 int;
r2 int;
i int:=0;
BEGIN
 l1:= (VALUE >> 16) & 65535;
 r1:= VALUE & 65535;
 WHILE i < 3 LOOP
   l2 := r1;
   r2 := l1 # ((((1366.0 * r1 + 150889) % 714025) / 714025.0) * 32767)::int;
   l1 := l2;
   r1 := r2;
   i := i + 1;
 END LOOP;
 RETURN ((l1::bigint << 16) + r1);
END;
$$ LANGUAGE plpgsql strict immutable;')

    Host.connection.execute("ALTER TABLE hosts ALTER COLUMN id SET DEFAULT pseudo_encrypt(nextval('hosts_id_seq'));")
  end

  def down
    drop_table :hosts
    Host.connection.execute("DROP FUNCTION IF EXISTS pseudo_encrypt(bigint);")
    # Host.connection.execute("ALTER TABLE hosts ALTER COLUMN id SET DEFAULT nextval('hosts_id_seq');")
  end
end
