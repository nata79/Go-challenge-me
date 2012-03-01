class CreateDisputes < ActiveRecord::Migration
  def change
    create_table :disputes do |t|
      t.integer :votes
      t.boolean :accepted
      t.text :description
      t.integer :record

      t.timestamps
    end
  end
end
