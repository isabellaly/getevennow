module CoreExtensions
  def require_salary_getter
    Dir["#{Rails.root}/lib/*.rb"].each do |f|
      require_dependency f
    end
  end
end
Object.instance_eval { include CoreExtensions }