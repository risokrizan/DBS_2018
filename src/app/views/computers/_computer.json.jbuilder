json.extract! computer, :id, :cpu_name, :cpu_clock, :cpu_cores, :gpu_name, :gpu_clock, :gpu_cores, :created_at, :updated_at
json.url computer_url(computer, format: :json)
