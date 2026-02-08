class CreateNewdates < ActiveRecord::Migration[7.2]
  def change
    create_table :newdates do |t|
      t.string :title
      t.date :startday
      t.date :endday
      t.boolean :allday
      t.string :memo

      t.timestamps
    end
  end
end
