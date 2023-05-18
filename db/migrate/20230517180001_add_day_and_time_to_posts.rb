class AddDayAndTimeToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :time, :string
    add_column :posts, :day, :string
  end
end
