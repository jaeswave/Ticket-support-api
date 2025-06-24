class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.string :title null
      t.string :status null: false
      t.string :resolved_at null: true
      t.references :customer, null: false, foreign_key: { to_table: :users }
      t.references :agent, null: true, foreign_key: { to_table: :users }



      t.timestamps
    end
  end
end
