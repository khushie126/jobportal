class RenameTypeColumnInJobPosts < ActiveRecord::Migration[7.1]
  def change
     
        rename_column :job_posts, :type, :job_type # or another name that fits your model
   
  end
end
