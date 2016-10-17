handle al pass
set print thread-events off

set $file_a = "/etc/fstab"
set $file_b = "/etc/passwd"
set $len = $_strlen($file_b)
set $len = $len + 1

catch syscall open
commands
  silent
  # $rax == return value
  # IF x64, $rdi == filename
  set $outside = ! $outside
  if ( $_streq((char *)$rdi, $file_a) )

    printf "rsp: %d\n", $rsp
    set $rsp = $rsp - $len

    printf "rsp: %d\n", $rsp
    call strcpy($newfile, $rsp)
    printf "rsp: %d\n", $rsp
    printf "%d: %s\n", $rsp,$rsp

    set $rsp = $rsp + $len
  end
  continue
end
run
