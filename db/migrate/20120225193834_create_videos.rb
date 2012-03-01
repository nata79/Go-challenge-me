class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :number
      t.text :description
      t.integer :dispute_id
      t.string :youtube_id

      t.timestamps
    end
  end
end
