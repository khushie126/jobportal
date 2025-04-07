class CreateJobPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :job_posts do |t|
      t.string :title
      t.string :type
      t.text :description
      t.integer :created_by
      t.timestamps
    end
  end
end
