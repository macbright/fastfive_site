class CreateWebhookEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :webhook_events do |t|
      t.string :ref
      t.integer :external_id
      t.json :data
      t.integer :state, default: 0

      t.timestamps
    end
    add_index :webhook_events, :ref
    add_index :webhook_events, :external_id
    add_index :webhook_events, [:ref, :external_id]
  end
end
