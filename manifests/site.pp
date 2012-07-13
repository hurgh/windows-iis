define iis::site (
  $hostname,
  $procotol,
  $ipaddress,
  $port,
  $certhash,
  $appid,
) {
  $site_path = "${iis::params::site_path}/${name}"
#	$site_path = 'Test'
	
  notify {'windows-iis site':
	message => "Windows IIS Site Addition:\n
				Site Path: ${site_path}\n
				Name: ${name}\n
				Hostname: ${hostname}\n",
	}
  
#  Exec {
#    path        => 'C:\windows\system32\inetsrv',
#    logoutput   => on_failure,
#    subscribe   => File[$site_path],
#    refreshonly => true,
#  }
#  exec { "add_site_${name}":
#    command => "appcmd set site /site.name:\"${name}\" /+bindings.[protocol='${protocol}',bindingInformation='${ipaddress}:${port}:${hostname}']"
#  }

#  exec { "add_site_${name}_cert":
#    command => "netsh http add sslcert ipport=${ipaddress}:${port} certhash=${certhash} appid={${appid}}",
#  }

#  file { $site_path:
#    ensure  => directory,
#    source  => "puppet:///files/ccsv2/${name}",
#    recurse => true,
#    #before => Appcmd_site[$name],
#    before  => Exec["add_site_${name}"],
#  }

  # Template uses $oracledbconnection
#  file { "${site_path}/web.config":
#    ensure  => present,
#    content => template('iis/web.config.erb'),
#    before  => Exec["add_site_${name}"],
#  }
}
