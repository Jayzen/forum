class CreateTopicAttaches < ActiveRecord::Migration[5.1]
  def change
    create_table :topic_attaches do |t|
      t.string :image
      t.integer :topic_id

      t.timestamps
    end
  end
end
