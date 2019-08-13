node ip-10-0-5-201 {
	include puppet
	include sshd
	include apache2
	include user
	include dovecot
	include mail
}

node ip-10-0-5-44 {
	include puppet
	include sshd
	include apache2
	include user
	include dovecot
	include mail
}
