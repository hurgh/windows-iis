# windows-IIS Class
# reference: http://learn.iis.net/page.aspx/133/using-unattended-setup-to-install-iis/
# DISM: http://technet.microsoft.com/en-us/library/dd744311(v=ws.10)
# requires the DISM module

class windows-iis {

	dism { 'IIS-WebServerRole':
		ensure => present,
	}
	dism { 'IIS-WebServer':
		ensure 	  => present,
		require   => Dism['IIS-WebServerRole'],
	}

	dism { 'IIS-CommonHttpFeatures':
		ensure => present,
		require   => Dism['IIS-WebServer'],
	}
	dism { 'IIS-StaticContent':
		ensure => present,
		require => Dism['IIS-CommonHttpFeatures'],
	}
	dism { 'IIS-DefaultDocument':
		ensure => present,
		require => Dism['IIS-CommonHttpFeatures'],
	}
	dism { 'IIS-DirectoryBrowsing':
		ensure => present,
		require => Dism['IIS-CommonHttpFeatures'],
	}
	dism { 'IIS-HttpErrors':
		ensure => present,
		require => Dism['IIS-CommonHttpFeatures'],
	}
	dism { 'IIS-HttpRedirect':
		ensure => present,
		require => Dism['IIS-CommonHttpFeatures'],
	}

	dism { 'IIS-ApplicationDevelopment':
		ensure => present,
		require => Dism['IIS-WebServer'],
	}

	dism { 'IIS-HealthAndDiagnostics':
		ensure => present,
		require => Dism['IIS-WebServer'],
	}
	dism { 'IIS-HttpLogging':
		ensure => present,
		require => Dism['IIS-HealthAndDiagnostics'],
	}
	dism { 'IIS-RequestMonitor':
		ensure => present,
		require => Dism['IIS-HealthAndDiagnostics'],
	}

	dism { 'IIS-Security':
		ensure => present,
		require => Dism['IIS-WebServer'],
	}
	dism { 'IIS-BasicAuthentication':
		ensure => present,
		require => Dism['IIS-Security'],
	}
	dism { 'IIS-WindowsAuthentication':
		ensure => present,
		require => Dism['IIS-Security'],
	}
	dism { 'IIS-DigestAuthentication':
		ensure => present,
		require => Dism['IIS-Security'],
	}
	dism { 'IIS-RequestFiltering':
		ensure => present,
		require => Dism['IIS-Security'],
	}

	dism { 'IIS-Performance':
		ensure => present,
		require => Dism['IIS-WebServer'],
	}
	dism { 'IIS-HttpCompressionStatic':
		ensure => present,
		require => Dism['IIS-Performance'],
	}

	dism { 'IIS-WebServerManagementTools':
		ensure => present,
		require => Dism['IIS-WebServer'],
	}
	dism { 'IIS-ManagementScriptingTools':
		ensure => present,
		require => Dism['IIS-WebServerManagementTools'],
	}

}
