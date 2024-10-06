class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.text :assigment_rule, null: false
      t.text :image_path
      t.references :category, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
