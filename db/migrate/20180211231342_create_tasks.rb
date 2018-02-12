class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :userId
      t.boolean :checked

      t.timestamps
    end
  end
end
