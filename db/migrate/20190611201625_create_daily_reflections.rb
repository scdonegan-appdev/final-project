class CreateDailyReflections < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_reflections do |t|
      t.text :reflection_text
      t.integer :user_id

      t.timestamps
    end
  end
end
