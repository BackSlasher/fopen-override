#!/bin/bash
gdb -batch -q -x script.gdb --args "$@"
