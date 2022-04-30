class CreateReview < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|

      t.datetime :registered_at, null: false
      t.references :content, foreign_key: true
      t.timestamps
    end
  end
end
