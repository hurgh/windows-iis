# Windows IIS Puppet Module

This module provides the ability to install IIS and add sites to IIS via Puppet on Windows.  

## Installation

This module depends on DISM module to enable the IIS web server role on Windows Server:

* [dism module](https://github.com/hurgh/windows-dism)
  
## Usage 

    iis::site { '':
      hostname  => '',
      protocol  => 'https'
      ipaddress => '',
      port      => '',
      certhash  => '',
      appid     => '',
      require   => Dism['IIS-WebServer'],
    }
	
## References

The site.pp module was originaly from [hunner](https://github.com/hunner/iis-module)