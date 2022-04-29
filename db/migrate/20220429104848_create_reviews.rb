class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|

      t.integer :content_id, null: false, index: true
      t.datetime :registered_at, null: false
      t.timestamps
    end
  end
end