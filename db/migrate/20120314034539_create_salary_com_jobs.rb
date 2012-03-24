class CreateSalaryComJobs < ActiveRecord::Migration
  def up
    create_table :salary_com_jobs do |t|
      t.string :title
      t.string :code
      t.string :bls_job_code
      t.timestamps
    end
  end
  
  def down
    drop_table :salary_com_jobs
  end
end
