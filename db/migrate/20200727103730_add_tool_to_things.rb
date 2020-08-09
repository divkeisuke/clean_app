class AddToolToThings < ActiveRecord::Migration[5.2]
  def change
    add_column :things, :tool1, :string
    add_column :things, :tool2, :string
    add_column :things, :tool3, :string
    add_column :things, :tool4, :string
    add_column :things, :tool5, :string
  end
end
