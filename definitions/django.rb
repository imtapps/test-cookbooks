define :django do
  releases_path = params[:releases_path]
  current_release = params[:current_release]
  environment = params[:environment]

  bash 'migrate' do
    cwd "#{releases_path}/#{current_release}"
    code "virtualenv/bin/python manage.py #{environment} migrate --noinput"
  end

  bash 'collectstatic' do
    cwd "#{releases_path}/#{current_release}"
    code "virtualenv/bin/python manage.py #{environment} collectstatic --noinput"
  end

  package 'gettext'
  bash 'compilemessages' do
    cwd "#{releases_path}/#{current_release}"
    code "virtualenv/bin/python manage.py #{environment} compilemessages"
  end

end
