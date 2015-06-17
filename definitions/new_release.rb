define :new_release do
  name = params[:name]
  releases_path = params[:releases_path]
  repo = params[:repo]

  directory releases_path do
    recursive true
  end

  git "#{releases_path}/#{name}" do
    repository repo
    action :checkout
  end
end
