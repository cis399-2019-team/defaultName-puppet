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
			Package["openshh-server"],
		],
	}

	ssh_authorized_key { "henzik_pub_kp":
		ensure => present,
		user   => "ubuntu",
		type   => "ssh_rsa",
		key	   => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCVUbl8/91D5mKl00k8+SRI7vN6m8gYH+NUIUT7vBNhn/RbzfP7z60CaBMX2103/1QdMA1XpLVTbxTC3Is/J3CaI+dpXWmx5kUnK6GCHhCi7UNV1Vkw1nHBgXIDlPlQYZ1iQL/v+DjPUPDRegB09VRd8NGuOtekCI920nq7tDSxnoO+0cH6D82WUGmkBOMXw2G8UdzPTc47NNCbLfBGs0WrxpjEIk/nOZjfrt8DYtJSk8r/Q6XjisAGDdtupjXeTGF5zFj27cmEAwQSmO2IJO1tWX+8WMlNI4awktpSA88V/OGqUuyEpr3NvzzuB69mjW1L689g7rm/+7uUw5Fd62rB"
	}

	ssh_authorized_key { "arobiso2-key-pair":
		ensure => present,
		user   => "ubuntu",
		type   => "ssh_rsa",
		key	=> "MIIEpAIBAAKCAQEAkOelnrr6wczWuYdWvI+uG8gPnJkBQAiILgBZi8OSIC5FlxTiLjPn2j4f5gTNbFKX39dKQEXHPdQWP92g2vE52nNHnl1qefvOCTjXGXCcRDZtnt6Q4LlhwQyXPGZh3xyUBnjvgWbw9UXoOM3UtKAuUXyP4g2sfkEPSdNoMj2qCrNgvWj0VI3LWP3XfsPW0j79CjIxdlrvTuVq69cw5aLOP85M4Kh63NfpP+1FuGoSyK+kljv9MVbCUIHmX9v/OeddPcAQnhV05weJeHLqXNK4qL7SFMEHgEkgkErgp60NTXPMtEUbrIFiKriWbW3ctiJI0sOeKx2q542pCOEC0iflowIDAQABAoIBAHKXbic3sKPgDJLNj28wpLx9mrL5YL61wJO4XRglAgMG9KuErVViYOD7LhimBZm7OzWeOK7ZP7YKacn5x4I9L8YsUh/PuitbUVWDqL8Kidl7vXbchW/hyodzIIp4YL+jBwCTVLxdnwIoVXvOcn6hCeARBGv86kMxyhhU4dqRX05z0ZtMiLuZhBsAa+fkRVS8nBPlfsh0L5dKz8L0+sWc8+tmsL/PIzSYeBl+X9FZmXGM1gqE8Gbj+QdSx4jrDih+YQ/8IwsHnhz/MHt9qvoOoE+n77l8fxr/JmL4ssC7l6OInRjWuIsOwTdKfJMzcs/PHfW+JzyYjZA8RQURUyV6+qECgYEA8t8lB6/bT4DJCeyHqvKOCAuF6Opc88cxqa+bk1jOOBZbm9mGQd5Q8qRd6dmP0MHYq6ZBWPrYfRxIi9pJ1sKNXv7F6JLvniwkuUrGfhvH0aYwzZWHTnqAxQLhBIXdxHmkPzN23QZc+eL1ZY7USMOPfxlzUBN0NU0ajNaY5/h7v/ECgYEAmLzWxp+PEul3nYNgSbkkwoKxgYtKdfQXwUQc1/d+3Rn1qrUwEWkLXk7Tyg/+YvKkBLipXf0aql5fsyDRG1gbQjT5QyGJDFNbd98VzhUaSD4rIbKAXqCKiu57/oONEEY5L52amGanOVcFpxVb9RyD3y6K40MOfIUJpnx4rdEF0tMCgYEAjsLiJmmVlV8TTVUOzkpzeIElfqq8ZsNxCthhr7Qky81AnhS4GWHP3UEGvx4WrlQzw3ofsWkJ9ki40BRJEQcdSHij5rjwRt6V26D7mkdEJpT03POHLHdP1/6APENf/0ytYkUjGnrSDkT9kGvrlrX1VHWmVayJw4cGE0FVcg2a2FECgYBPih/LBfLLJXveMjllix4ikU8BKFmZfYkVY3Ql38RYPhmaUYr7thluflx6oMOYIcXak5PX12QYjtcFgLSEqehgHRglpoQpQAulLC69yG2Ma5uoi72gCbi8Sx+VVkqSzA8hxdBpRyQUj0XpUg02YyglhKZdXWFg5SM2aSGrWuvOcwKBgQCs52dpVvvhf+L2W6ryEp1JpaOQdqFH/IlTy/+jFui5R2vPbcJuIr+aRXyhuYfPK3FDArQ4i/YOMRCn99Z/k/e/MNVowQH+ov/BGUkUjIAyEwlo1wwuqCj05z2lZmk39AtETRz8+aXAWSeQJSlvMJPYcuAimjLrBJcPx82o/lF4BA==",
	}
}

