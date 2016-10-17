The goal is to create a binary that will run another binary
It will ptrace-attach to the second binary, and look for syscalls
It will detect fopen syscalls, and whenever it happens
Extract the filename (stored in some register) and compare it to `FILENAME_A`
If matches, we will replace it to `FILENAME_B` like this:
Save old position of stack pointer
Increase stack pointer by `FILENAME_B` length and store `FILENAME_B` in the resulting space in the stack (thusly pushing it to the stack)
Modify register pointing to filename to point to the `FILENAME_B` now in the stack
proceed with syscall
after syscall returns, manually pop the string from the stack, then return to the process
