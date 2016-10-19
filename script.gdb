handle all pass
set print thread-events off

start
set $file_a = "/etc/fstab"
set $file_b = "/etc/passwd"
set $p_file_b = (int64_t)($file_b)

printf "1 | %d | %s", $file_b, $file_b
printf "2 | %d | %s", $p_file_b, $p_file_b

catch syscall open
commands
  silent
  # $rax == return value
  # IF x64, $rdi == filename
  #p $file_a
  if ($_streq($file_a, (char *)$rdi))
    x/s $rdi
    # I'm guessing there is some sort of alignment issue here
    set $rdi = $p_file_b
    x/s $rdi
  end
  continue
end
run
