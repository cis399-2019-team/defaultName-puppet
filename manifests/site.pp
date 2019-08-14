node ip-10-0-5-201 {
	include puppet
	include sshd
	include apache2
	include user
	include postfix
}

node ip-10-0-5-44 {
	include puppet
	include sshd
	include apache2
	include user
	include postfix
}
