class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.date :start_date
      t.date :end_date
      t.string :college_name
      t.string :school_name
      t.string :grade

      t.timestamps
    end
  end
end
