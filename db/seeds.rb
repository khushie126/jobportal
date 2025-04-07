require "faker"
require 'pry'
puts "=======Started user creation==========="
roles = [ "admin", "job_seeker", "job_seeker","recruiter","recruiter"]

roles.each_with_index do |role, count|

  u = User.find_or_create_by(email: "user_#{count}@gmail.com") do |user|

    user.password = '123456'

    user.password_confirmation = '123456'

    user.role = role

  end
  # Ensure role is assigned if the user already exists

  u.update!(role: role) unless u.role == role

end
puts "=======Completed user creation========="


puts "=======Started company creation==========="
# create companies
company_size = 5
company_size.times do |count|
  c = Company.find_or_create_by(company_name: "Company#{count}")
  c.description = Faker::Company.catch_phrase
  c.save!
end
puts "=======Completed company creation=========" 

puts "=======Started JobPost creation==========="

company =Company.all
company.each do|count|
    jb = JobPost.find_or_create_by(title: "title#{count.id}")
    jb.description =Faker::Company.catch_phrase
    jb.company_id = Company.all.sample.id
    jb.created_by = User.recruiter.sample.id
    jb.save! 
end
puts "=======Completed JobPost creation=========" 

puts "=======Started Application creation==========="

# Define the specific statuses you want to use
statuses = ["inprogress", "interview", "accepted", "rejected"]

jbp = JobPost.all
jbp.each do |job_post|
  status = statuses.sample # Get a random status

  # Create or find an AppliedJob and set necessary attributes
  applied_job = AppliedJob.find_or_create_by(status: status, job_post_id: job_post.id) do |a|
    a.company_id = Company.all.sample.id
    a.user_id = User.recruiter.sample.id
    a.count = AppliedJob.count
  end
  
  # In case the job wasn't found, but we still want to update any missing fields
  applied_job.save! if applied_job.new_record?
end


puts "=======Completed Application creation=========" 


users = User.all

profile_info = 0
users.each do |user|
  pi = ProfileInformation.find_or_create_by(firstname: "fname_#{user.id}")
  pi.lastname = Faker::Name.last_name
  pi.user = user 
  pi.save!

  profile_info = profile_info + 1

  puts "#{profile_info} profile_information created"
  puts "User #{user.id} has role: #{user.role}"

  if user.recruiter?
     pi.company_id = Company.all.sample.id
     puts "company id #{pi.company_id} assigned to profile information #{pi.id}"
     pi.save!
  end

  # create experices 
  puts "=======Started experience creation==========="

    ex = pi.experiences.find_or_create_by(company_name: "company_#{pi.id}")
    ex.start_date = Faker::Date.forward(days: 23)
    ex.end_date = Faker::Date.forward(days: rand(24..60))
    ex.description = Faker::Company.catch_phrase
    ex.profile_information = pi
    ex.save!
  puts "=======Completed experience creation=========" 


  puts "=======Started education creation==========="

  ed = pi.educations.find_or_create_by(college_name: "college_#{pi.id}")
  ed.school_name = Faker::Name
  ed.start_date = Faker::Date.forward(days: 23)
  ed.end_date = Faker::Date.forward(days: rand(24..60))
  ed.profile_information = pi
  ed.save!
  puts "=======Completed education creation=========" 


  puts "=======Started Project creation==========="

  pr = pi.projects.find_or_create_by(title: "title_#{pi.id}")
  pr.description =  Faker::Company.catch_phrase
  pr.profile_information = pi
  pr.save!

  puts "=======Completed Project creation========="
end

  puts "=======Started skill creation==========="
    #skill
    skills = ["Ruby", "JavaScript", "Python", "Java", "HTML", "CSS", "React", "Rails"]
    skills.each do |skill_name|
    Skill.find_or_create_by(name: skill_name)
    end
    
    puts "=======Completed skill creation==========="
    

  puts "=======Started User skill creation==========="

  # pis=ProfileInformationSkill.find_or_create_by(profile_information_id: ProfileInformation.all.sample.id)
  # pis.skill_id = Skill.all.sample.id
  
  ProfileInformation.find_each.with_index do |profile|
    random_skills = Skill.all.sample(3) # Pick a random number of skills (1 to 5)
    
    random_skills.each do |skill|
      # Only create the association if it doesn't already exist
      unless ProfileInformationSkill.exists?(profile_information_id: profile.id, skill_id: skill.id)
        ProfileInformationSkill.create(profile_information_id: profile.id, skill_id: skill.id)
      end
    end
  end
  
  puts "=======Completed User skill creation==========="


 puts "=======Started jobpost skill creation==========="
  # jps=JobPostSkill.find_or_create_by(job_post_id: JobPost.all.sample.id)
  # jps.skill_id = Skill.all.sample.id
  JobPost.find_each.with_index do |job_post, index|
  
    random_skills = Skill.all.sample(3)
   
    random_skills.each do |skill|
     
      unless JobPostSkill.exists?(job_post_id: job_post.id, skill_id: skill.id)
      JobPostSkill.find_or_create_by(job_post_id: job_post.id, skill_id: skill.id)
    end
  end
end

puts "=======completed jobpost skill creation==========="