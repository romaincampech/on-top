class DropTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :friendly_id_slugs
  end
end
