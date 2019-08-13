class mail {
	service { "postfix":
		enable => true,
		ensure => running,
	}
}
