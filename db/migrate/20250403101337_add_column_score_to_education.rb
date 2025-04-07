class AddColumnScoreToEducation < ActiveRecord::Migration[7.1]
  def change
    remove_column :educations, :grade
    add_column :educations, :score_type, :integer, default: 0
    add_column :educations, :score, :string
  end
end
