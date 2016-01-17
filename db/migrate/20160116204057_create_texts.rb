class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :url, null: false

      t.timestamps null: false
    end
  end
end
