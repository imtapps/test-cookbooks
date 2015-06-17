define :python do
  releases_path = params[:releases_path]
  current_release = params[:current_release]
  environment = params[:environment]

  virtualenv_path = "#{releases_path}/#{current_release}/virtualenv"
  python_virtualenv virtualenv_path do
    action :create
  end

  bash 'pip_install' do
    code "#{virtualenv_path}/bin/pip install -r #{releases_path}/#{current_release}/requirements/#{environment}.txt"
  end
end
