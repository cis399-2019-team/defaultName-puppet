class sshd {
	package { "openssh-server":
		ensure	 => installed,
		provider => apt,
	}

	file { "/etc/ssh/sshd_config":
		ensure	=> present,
		notify	=> Service["sshd"],
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

	ssh_authorized_key { "henzik_pub_kp":
		ensure => present,
		user   => "ubuntu",
		type   => "ssh_rsa",
		key    => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCVUbl8/91D5mKl00k8+SRI7vN6m8gYH+NUIUT7vBNhn/RbzfP7z60CaBMX2103/1QdMA1XpLVTbxTC3Is/J3CaI+dpXWmx5kUnK6GCHhCi7UNV1Vkw1nHBgXIDlPlQYZ1iQL/v+DjPUPDRegB09VRd8NGuOtekCI920nq7tDSxnoO+0cH6D82WUGmkBOMXw2G8UdzPTc47NNCbLfBGs0WrxpjEIk/nOZjfrt8DYtJSk8r/Q6XjisAGDdtupjXeTGF5zFj27cmEAwQSmO2IJO1tWX+8WMlNI4awktpSA88V/OGqUuyEpr3NvzzuB69mjW1L689g7rm/+7uUw5Fd62rB"
	}

	ssh_authorized_key { "arobiso2-key-pair":
		ensure => present,
		user   => "ubuntu",
		type   => "ssh_rsa",
<<<<<<< HEAD
=======
		key    => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCQ56WeuvrBzNa5h1a8j64byA+cmQFACIguAFmLw5IgLkWXFOIuM+faPh/mBM1sUpff10pARcc91BY/3aDa8Tnac0eeXWp5+84JONcZcJxENm2e3pDguWHBDJc8ZmHfHJQGeO+BZvD1Reg4zdS0oC5RfI/iDax+QQ9J02gyPaoKs2C9aPRUjctY/dd+w9bSPv0KMjF2Wu9O5Wrr1zDlos4/zkzgqHrc1+k/7UW4ahLIr6SWO/0xVsJQgeZf2/855109wBCeFXTnB4l4cupc0riovtIUwQeASSCQSuCnrQ1Nc8y0RRusgWIquJZtbdy2IkjSw54rHarnjakI4QLSJ+Wj",		
>>>>>>> d73b366b00146f71b182ccc8fa3d83e069dcb568
	}
}

