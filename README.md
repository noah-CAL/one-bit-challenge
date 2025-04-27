# One-Bit Challenge

This repository contains the C code for the [one-bit challenge](www.noahsedlik.com/blog/one-bit-challenge-1) on my website!

See the [one-bit challenge](www.noahsedlik.com/blog/one-bit-challenge-1) introduction for more information.

## Dockerfile

This challenge can be done without any external tools by just compiling `gcc` locally. If you wish to complete it in the RISC-V ISA, you will need a cross-compiler installed which may be installed via the optional Docker image in this repository. *The cross-compiler installation takes several hours**. 

The image can be installed by running

```
>$ make build_image
```

Then, the image can be entered via a shell which will have access to the RISC-V binary utilities.

```
>$ make shell
Welcome! RISC-V tools are available at /opt/riscv/bin:
riscv64-unknown-elf-addr2line  riscv64-unknown-elf-elfedit     riscv64-unknown-elf-gcc-ranlib     riscv64-unknown-elf-gprof     riscv64-unknown-elf-objdump  riscv64-unknown-elf-strip
riscv64-unknown-elf-ar         riscv64-unknown-elf-g++         riscv64-unknown-elf-gcov           riscv64-unknown-elf-ld        riscv64-unknown-elf-ranlib
riscv64-unknown-elf-as         riscv64-unknown-elf-gcc         riscv64-unknown-elf-gcov-dump      riscv64-unknown-elf-ld.bfd    riscv64-unknown-elf-readelf
riscv64-unknown-elf-c++        riscv64-unknown-elf-gcc-14.2.0  riscv64-unknown-elf-gcov-tool      riscv64-unknown-elf-lto-dump  riscv64-unknown-elf-run
riscv64-unknown-elf-c++filt    riscv64-unknown-elf-gcc-ar      riscv64-unknown-elf-gdb            riscv64-unknown-elf-nm        riscv64-unknown-elf-size
riscv64-unknown-elf-cpp        riscv64-unknown-elf-gcc-nm      riscv64-unknown-elf-gdb-add-index  riscv64-unknown-elf-objcopy   riscv64-unknown-elf-strings

root@1fdfd6a12a47:/src ls
Dockerfile  Makefile  README.md  main.c  hints.txt

root@1fdfd6a12a47:/src riscv64-unknown-elf-objdump mystery
...
```

## Executing the Binary

If running with RISC-V, compile a static binary with the following: 

```
>$ riscv64-unknown-elf-gcc main.c -o mystery -static
```

The `-static` is to ensure that there are no missing libraries. Then, it can be run with QEMU:

```
>$ qemu-riscv64-static mystery
```

If compiled locally (x86, ARM, etc.) with `gcc` then simply running the executable will work.

By default, `main.c` will output the hash for the binary file named `mystery`. Feel free to change the `BIN_FILE` macro definition. 

Remember that your goal is to make the executable print `Success`! See the [one-bit challenge](www.noahsedlik.com/blog/one-bit-challenge-1) introduction for more information.

Good luck!
