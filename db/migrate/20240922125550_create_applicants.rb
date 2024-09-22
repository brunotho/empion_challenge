class CreateApplicants < ActiveRecord::Migration[7.2]
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.references :culture_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
