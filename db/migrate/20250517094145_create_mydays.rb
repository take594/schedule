class CreateMydays < ActiveRecord::Migration[6.1]
  def change
    create_table :mydays do |t|
      t.string :title
      t.datetime :start_day
      t.datetime :end_day
      t.boolean :allday
      t.text :memo

      t.timestamps
    end
  end
end
