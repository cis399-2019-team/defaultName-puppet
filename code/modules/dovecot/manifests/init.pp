class dovecot {
	package { "dovecot":
		ensure => installed;
	}

	file { "/etc/dovecot/dovecot.conf":
		ensure	=> present,
		mode	=> '444',
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/dovecot/dovecot.conf",
		require	=> Package["dovecot"],
	}

	service { "dovecot":
		enable    => true,
		ensure    => running,
		subscribe => File["/etc/dovecot/dovecot.conf"],
	}
}
