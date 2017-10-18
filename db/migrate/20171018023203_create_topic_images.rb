class CreateTopicImages < ActiveRecord::Migration[5.1]
  def change
    create_table :topic_images do |t|
      t.integer :weight, default: 0
      t.string :attach
      t.integer :topic_id

      t.timestamps
    end
  end
end
