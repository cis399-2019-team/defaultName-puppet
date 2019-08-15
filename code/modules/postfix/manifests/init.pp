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
		notify     => Service["postfix"],
		mode       => '444',
		owner      => 'root',
		group      => 'root',
		source     => [
			"puppet:///modules/postfix/$hostname/main.cf",
		]
	}
}
