class profiles::webserver::nginx (
$repo_files       = undef,
$repo_templates   = undef,
$config_overwrite = 'no',
) {

  notice("##I> repo_files($repo_files) templates($repo_templates) overwrite($config_overwrite)")

#  if $pool {
#    if $template_conf && $template_proxy {
#      class { '::nginx' : 
#        conf_template       => $template_conf,
#        proxy_conf_template => $template_proxy,
#    }
#  }

#  if $pool {
    # install nginx
    if $repo_files and $repo_templates {
      class { '::nginx' :
        repo_files     => $repo_files,
        repo_templates => $repo_templates,
        reconfig       => $config_overwrite,
      }
    } else {
      class { '::nginx' : }
    }

}
