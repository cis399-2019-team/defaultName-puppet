class postfix {
	package { "mailutils":
		ensure => installed,
	}

	service { "postfix":
		enable => true,
		ensure => running,

		# Add Source [] below
	}
}
