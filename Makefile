.PHONY: nslookup

nslookup:
	gdb --batch -q -x script.gdb --args nslookup 8.8.8.8

test:
	gdb -batch -q -x script.gdb --args python -c 'print(open("/etc/resolv.conf","r").readlines())'
