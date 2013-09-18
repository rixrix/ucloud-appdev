node default {
  include init
  include packages
}

/***********************************************************************************************************************
 * Packages
 ***********************************************************************************************************************/
class packages {
  include packages::install
}

class packages::install {
  package { 'couchdb':
    ensure => installed
  }
}

/***********************************************************************************************************************
 * Initialization
 ***********************************************************************************************************************/
class init {
  include init::repo
}

class init::repo {
  yumrepo {
    'epel':
    name => 'epel',
    descr => 'Extra Packages for Enterprise Linux 6',
    mirrorlist => 'http://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    enabled => 1,
    gpgcheck => 0,
    failovermethod => 'priority'
  }
}

