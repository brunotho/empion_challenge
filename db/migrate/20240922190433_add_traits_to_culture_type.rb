class AddTraitsToCultureType < ActiveRecord::Migration[7.2]
  def change
    add_column :culture_types, :taste, :integer
    add_column :culture_types, :reaction_time, :integer
    add_column :culture_types, :ambition, :string
  end
end
