class postfix {
	package { "mailutils":
		ensure => installed,
	}

	service { "postfix":
		enable => true,
		ensure => running,
	}

	file { "/etc/postfix/main.cf":
		ensure	=> present,
		source	=> "puppet:///modules/postfix/main.cf",
		myorigin = "/etc/$hostname",
	}
}
