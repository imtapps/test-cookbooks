define :symlink do
  name = params[:name]
  environment = params[:environment]
  releases_path = params[:releases_path]
  current_release = params[:current_release]

  link "#{releases_path}/../current" do
    to "#{releases_path}/#{current_release}"
    action :create
  end

  link "#{releases_path}/../current/#{name}/settings/deployed.py" do
    to "#{releases_path}/../current/#{name}/settings/#{environment}.py"
    action :create
  end
end
