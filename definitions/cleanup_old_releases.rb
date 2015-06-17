define :cleanup_old_releases do
  releases_path = params[:name]
  keep = params[:keep]

  releases = `ls #{releases_path}`.split

  (releases - releases.last(keep)).each do |old|
    directory "#{releases_path}/#{old}" do
      recursive true
      action :delete
    end
  end
end
