class DisputesUsers < ActiveRecord::Migration
  def change
    create_table :disputes_users do |t|
      t.integer :user_id
      t.integer :dispute_id
    end
  end
end
