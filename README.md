# crosstool-ng
Toolchain from scratch


Setup the build environment to use external cross compiler 

```
CROSS_COMP_PATH        = /opt/toolchain/x-tools/x86_64-pc-linux-musl
CROSS_COMP_PREFIX      = x86_64-pc-linux-musl-
CROSS_COMPILE          = $(CROSS_COMP_PATH)/bin/$(CROSS_COMP_PREFIX)

CC                     = $(CROSS_COMPILE)gcc
LD                     = $(CROSS_COMPILE)ld
OBJCOPY                = $(CROSS_COMPILE)objcopy
```



Include musl by adding -lc and --static 

The binary will now access the kernel directly, and have dependency iof the runtime C library on the host. 



```
.PHONY: foobar
build:
        $(CC)  -o foobar bar_foss_1.0.0/bar.o foo_foss_1.0.0/foo.o  -lc --static
#  Output of file command
#  ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped


```



