class CreateTimetrackings < ActiveRecord::Migration
  def change
    create_table :timetrackings do |t|
      t.references :user
      t.string :started_client_ip
      t.string :finished_client_ip
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
