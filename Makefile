.PHONY: nslookup python perl

nslookup:
	bash test.sh nslookup 8.8.8.8

python:
	bash test.sh python -c 'print open("/etc/fstab").read()'

perl:
	bash test.sh perl -e 'open FILE, "/etc/fstab" or die "$$!"; print <FILE>;'
