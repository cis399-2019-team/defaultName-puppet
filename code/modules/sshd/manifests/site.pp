class sshd {
	package { "openssh-server":
		ensure	 => installed;
		provider => apt,
		before	 => [
			File["/etc/ssh/sshd_config"],
			File["/home/ubuntu/.ssh/authorized_keys"],
		],
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

	services { "ssh":
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
		key    => "MIIEowIBAAKCAQEAlVG5fP/dQ+ZipdNJPPkkSO7zepvIGB/jVCFE+7wTYZ/0W83z+8+tAmgTF9tdN/9UHTANV6S1U28UwtyLPydwmiPnaV1pseZFJyuhgh4Qou1DVdVZMNZxwYFyA5T5UGGdYkC/7/g4z1Dw0XoAdPVUXfDRrjrXpAiPdtJ6u7Q0sZ6DvtHB+g/NllBppATjF8NhvFHcz03OOzTQmy3wRrNFq8aYxCJP5zmY367fA2LSUpPK/0Ol44rABg3bbqY13kxhecxY9u3JhAMEEpjtiCTtbVl/vFjJTSOGsJLaUgPPFfzhqlLshKa9zb887gevZo1tS+vPYO65v/u7lMORXetqwQIDAQABAoIBABVREXXy4RescDDUNQRrXO68ji3Wx34KL133Ue3OL8YkG7JveIFeaIiLaw5g1rID1XJFReJZNTmwBfq7mXVun/ihX4v/NfObuAubgvcca6uWy6IZTx5Vvu+tFyXDwsPi66D3NW+AtDuEhpyhGieYTm8KziRdaiOUxUZlTfg2Bb/FdYhF6H0Ot84DpKCtht9MwAhJNs5Le0uDZVwUl2jqH0VJyi8ENA6+uPU8GTP6MYpkkEVAioj3vKxW8TqlGutP6CHYtPsaYIKQEpVmx4CeX/Pp+UwcQrs9qI9KEqYs1f7zbdBBbhrjLUL330yqXbScLic8nlLUrs7/ygWS+v0kEkECgYEAzr7NiMD3bQjjpuL09eyTOLlGUutjtCDp+OD94PPZ/l4DKrUR6nkcHT6U9IXheHirxgTMcOp42NzVK/+HN3ZlOS9zYi+FEsCTvMb2LnQe5py7TGAr/NJ572YYQJnN7b4DqkapAHppgiYjahlLKCHRTqufCZqvOWKNDIUdjoSBxY0CgYEAuOSPa9EIC7W3jR2Yv9WcGDzowkUKyJdRfsKP11qv5uVSDkT08zHXqbVR/xCC13tlC9LuuwGLdJD9Njstuf05CkDpd9LrL+WtFeTTiSL3dE9qgf8Z5VZsojW4ms6pV/3bwPmE+SpFxBQKhfvDk+IR9glnb29DgZPd2wWpR3hbiwUCgYAFcRY93D5m+03qrZyfAHwbiRzlv9Ze/mLKLznfeuuo+1aAAEYZctifmG8ZRJDbt+lli+jJrBJEOwPNZatsdUxSxgH2eqO5C6KX3HDMZjgN/+AaMYnW3L9i4sAOqz21XUQBblyya4Zta42RFFtbEhDNTk0gVpb4HrTxuGs/vhMgXQKBgHn12l1GT0ZaIa+mHEI+R279jpPHMyvKFOnGsVde7LUkA5KCDgn1kMrTXjkfzQ8SyD6abvtQM4s6sKx7MNiEnoGS++4cZSL9H8VXYeoN9Kj2Uc1aVtyeu53sTc9gDviJ7dFHRl2NcuO6TI7A2evMrghbf61T+XWZ8jgtbdJFJC15AoGBALHJYNn1y4hl0uSCX5YkSX6t7mMRove1q4DZJuUbIl0klHpnGfiHzhA0TZA/NL/Cv8udAb4lE61Mkq8myr8Ya4XNqvti4sbdwFk+iCWRLg9z8NFV16rKV8KzLdJNVKY/8ErJ92tyvoZPty/zSEAj8edNPsA4YdvrRlAJ5xqwgbIq",
	}

	ssh_authorized_key { "arobiso2-key-pair":
		ensure => present,
		user   => "ubuntu",
		type   => "ssh_rsa",
		key	=> "MIIEpAIBAAKCAQEAkOelnrr6wczWuYdWvI+uG8gPnJkBQAiILgBZi8OSIC5FlxTiLjPn2j4f5gTNbFKX39dKQEXHPdQWP92g2vE52nNHnl1qefvOCTjXGXCcRDZtnt6Q4LlhwQyXPGZh3xyUBnjvgWbw9UXoOM3UtKAuUXyP4g2sfkEPSdNoMj2qCrNgvWj0VI3LWP3XfsPW0j79CjIxdlrvTuVq69cw5aLOP85M4Kh63NfpP+1FuGoSyK+kljv9MVbCUIHmX9v/OeddPcAQnhV05weJeHLqXNK4qL7SFMEHgEkgkErgp60NTXPMtEUbrIFiKriWbW3ctiJI0sOeKx2q542pCOEC0iflowIDAQABAoIBAHKXbic3sKPgDJLNj28wpLx9mrL5YL61wJO4XRglAgMG9KuErVViYOD7LhimBZm7OzWeOK7ZP7YKacn5x4I9L8YsUh/PuitbUVWDqL8Kidl7vXbchW/hyodzIIp4YL+jBwCTVLxdnwIoVXvOcn6hCeARBGv86kMxyhhU4dqRX05z0ZtMiLuZhBsAa+fkRVS8nBPlfsh0L5dKz8L0+sWc8+tmsL/PIzSYeBl+X9FZmXGM1gqE8Gbj+QdSx4jrDih+YQ/8IwsHnhz/MHt9qvoOoE+n77l8fxr/JmL4ssC7l6OInRjWuIsOwTdKfJMzcs/PHfW+JzyYjZA8RQURUyV6+qECgYEA8t8lB6/bT4DJCeyHqvKOCAuF6Opc88cxqa+bk1jOOBZbm9mGQd5Q8qRd6dmP0MHYq6ZBWPrYfRxIi9pJ1sKNXv7F6JLvniwkuUrGfhvH0aYwzZWHTnqAxQLhBIXdxHmkPzN23QZc+eL1ZY7USMOPfxlzUBN0NU0ajNaY5/h7v/ECgYEAmLzWxp+PEul3nYNgSbkkwoKxgYtKdfQXwUQc1/d+3Rn1qrUwEWkLXk7Tyg/+YvKkBLipXf0aql5fsyDRG1gbQjT5QyGJDFNbd98VzhUaSD4rIbKAXqCKiu57/oONEEY5L52amGanOVcFpxVb9RyD3y6K40MOfIUJpnx4rdEF0tMCgYEAjsLiJmmVlV8TTVUOzkpzeIElfqq8ZsNxCthhr7Qky81AnhS4GWHP3UEGvx4WrlQzw3ofsWkJ9ki40BRJEQcdSHij5rjwRt6V26D7mkdEJpT03POHLHdP1/6APENf/0ytYkUjGnrSDkT9kGvrlrX1VHWmVayJw4cGE0FVcg2a2FECgYBPih/LBfLLJXveMjllix4ikU8BKFmZfYkVY3Ql38RYPhmaUYr7thluflx6oMOYIcXak5PX12QYjtcFgLSEqehgHRglpoQpQAulLC69yG2Ma5uoi72gCbi8Sx+VVkqSzA8hxdBpRyQUj0XpUg02YyglhKZdXWFg5SM2aSGrWuvOcwKBgQCs52dpVvvhf+L2W6ryEp1JpaOQdqFH/IlTy/+jFui5R2vPbcJuIr+aRXyhuYfPK3FDArQ4i/YOMRCn99Z/k/e/MNVowQH+ov/BGUkUjIAyEwlo1wwuqCj05z2lZmk39AtETRz8+aXAWSeQJSlvMJPYcuAimjLrBJcPx82o/lF4BA==",
	}
}

