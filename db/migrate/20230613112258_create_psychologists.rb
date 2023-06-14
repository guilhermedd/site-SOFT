class CreatePsychologists < ActiveRecord::Migration[7.0]
  def change
    create_table :psychologists do |t|
      t.string :name

      t.timestamps
    end
  end
end
