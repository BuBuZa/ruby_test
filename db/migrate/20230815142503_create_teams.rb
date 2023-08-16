class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :division
      t.boolean :champion

      t.timestamps
    end
  end
end
