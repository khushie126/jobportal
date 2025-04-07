class AddUniqueIndexToJobPostSkills < ActiveRecord::Migration[7.1]
  def change
    add_index :job_post_skills, [:job_post_id, :skill_id], unique: true, name: 'index_job_post_skills_on_job_post_and_skill'

  end
end
