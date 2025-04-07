class CreateJobpostSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :job_post_skills do |t|
      t.belongs_to :job_post
      t.belongs_to :skill
      t.integer :level

      t.timestamps
    end
  end
end
