class SalaryComJobsController < ApplicationController
  def index
    searchterm = "#{params[:term]}".upcase
    @salarycomjobs = SalaryComJob.order(:title).where("upper(title) like ?", "%#{searchterm}%").limit(15).uniq()
    render json: @salarycomjobs.map{|job| {label: job.title, value: job.code}}
  end
end
