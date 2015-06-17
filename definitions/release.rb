define :release do
  name = params[:name]
  repo = params[:repo]
  environment = params[:environment]
  releases_path = "/var/www/#{name}/releases"
  current_release = Time.new.strftime("%Y%m%d%H%M%S")

  new_release current_release do
    releases_path releases_path
    repo repo
  end

  cleanup_old_releases releases_path do
    keep node[:opsworks_cookbooks][:old_releases]
  end

  python name do
    releases_path releases_path
    current_release current_release
    environment environment
  end

  django name do
    releases_path releases_path
    current_release current_release
    environment environment
  end

  symlink name do
    releases_path releases_path
    current_release current_release
    environment environment
  end
end
