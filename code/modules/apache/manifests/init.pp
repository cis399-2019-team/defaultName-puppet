class apache {
	package { "apache2":
		ensure	 => installed,
		provider => apt,
	}

	file { "/etc/apache2/apache2.conf":
		ensure	=> present,
		mode	=> '444',
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/apache/apache2.conf",
		require	=> Package["apache2"],
	}

	service { "apache":
		enable    => true,
		ensure    => running,
		subscribe => File["/etc/apache2/apache2.conf"],
		require   => [ Package["apache2"], ],
	}
}
