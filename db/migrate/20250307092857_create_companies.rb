class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.text :description
      t.string :location
      t.float :review

      t.timestamps
    end
  end
end
