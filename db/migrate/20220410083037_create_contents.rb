class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|

      t.string :question, null: false, index: true
      t.string :answer, null: false, index: true
      t.references :section, foreign_key: true
      t.timestamps
    end
  end
end
