class postfix {
	package { "mailutils":
		ensure => installed,
	}

	service { "postfix":
		enable => true,
		ensure => running,
	}

	file { "/etc/postfix/main.cf":
		ensure     => present,
		mode       => '444',
		owner      => 'root',
		group      => 'root',
		source     => [
			"puppet:///modules/postfix/$hostname/main.cf",
		]
	}
}
