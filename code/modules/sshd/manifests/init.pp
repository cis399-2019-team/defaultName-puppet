class sshd {
	package { "openssh-server":
		ensure	 => installed,
		provider => apt,
	}

	file { "/etc/ssh/sshd_config":
		ensure	=> present,
		notify	=> Service["ssh"],
		mode	=> '444',
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/sshd/sshd_config",
		require => Package["openssh-server"],
	}

	service { "ssh":
		enable	  => true,
		ensure	  => running,
		subscribe => File["/etc/ssh/sshd_config"],
		require	  => [
			Package["openssh-server"],
		],
	}

	ssh_authorized_key { "henzik_key":
		ensure => present,
		user   => "ubuntu",
		type   => "ssh-rsa",
		key    => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCOLytqui3m1l3IQIxcyqQwiWxOZM+IzGYSNpxJ8gnGtYMueYq7OBdayD+ASbbeBexI3YqXGfCdZOhAir6REsBGS9ufVvJn3ljFzcVtMtgfWmwCqODbUtllVfkq8nDoiH5e5U+yPdYDUsuVN6EkczuRMx8M4gMLKFWlgSKM6IFlDWAzcxTvH5DdPZ41Dt2Q+EvszklYAw9ENBMfBfd072wyixYJiPabZfyrjw/PTv1MtIN8OiiB4itWyhpD/olorfX2kVigP8l0SGdeeqFZsm4fx+Vh4BrWJdXMh5PVpWbMjHDH4phDHyPW9g9EPebrOJXK6Rcwr4KGBveIsCjEOUIT",
	}

	ssh_authorized_key { "arobiso2-key-pair":
		ensure => present,
		user   => "ubuntu",
		type   => "ssh-rsa",
		key    => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCQ56WeuvrBzNa5h1a8j64byA+cmQFACIguAFmLw5IgLkWXFOIuM+faPh/mBM1sUpff10pARcc91BY/3aDa8Tnac0eeXWp5+84JONcZcJxENm2e3pDguWHBDJc8ZmHfHJQGeO+BZvD1Reg4zdS0oC5RfI/iDax+QQ9J02gyPaoKs2C9aPRUjctY/dd+w9bSPv0KMjF2Wu9O5Wrr1zDlos4/zkzgqHrc1+k/7UW4ahLIr6SWO/0xVsJQgeZf2/855109wBCeFXTnB4l4cupc0riovtIUwQeASSCQSuCnrQ1Nc8y0RRusgWIquJZtbdy2IkjSw54rHarnjakI4QLSJ+Wj",		
	}
}

