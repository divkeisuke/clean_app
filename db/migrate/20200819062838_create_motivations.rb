class CreateMotivations < ActiveRecord::Migration[5.2]
  def change
    create_table :motivations do |t|
      t.string :word
      t.timestamps
    end
  end
end
