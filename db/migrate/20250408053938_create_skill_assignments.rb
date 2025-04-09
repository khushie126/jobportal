# db/migrate/20240407123456_create_skill_assignments.rb
class CreateSkillAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :skill_assignments do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :skillable, polymorphic: true, null: false
      t.integer :level, null: false, default: 0  # default to beginner

      t.timestamps
    end

    add_index :skill_assignments, [:skill_id, :skillable_type, :skillable_id], unique: true, name: 'index_skill_assignments_on_skill_and_skillable'
  end
end
