This project covers the Baremetal programming method for running a embedded project on the STM32F407 Cortex-M4 processor
Requisit on your system:
        -  Need to have arm-GCC tool chain
        - Some resources about the GCC and its __attribute__  = https://gcc.gnu.org/onlinedocs/gcc-15.2.0/gcc/Common-Function-Attributes.html
        -  GNU MAKE engine for windows

 - makefile.mak contains commands to generate the binaries from source code using arm-GCC toolchain 
        /*---------
        common syntax
        finalfile :  dependencies files
	        command  ( command can be made using a FLAGS) which are predefined
        ---------*/
file
- if we want to see all the symbol of the elf file 
run the command 
arm-none-eabi-nm.exe <name_of_elf_file>


- if you want to reun the objdump on elf file
arm-none-eabi-objdump.exe  -h <name_of_elf_file>

- Open OCD :  Host application for programming and debugging the target 

- St link driver - A usb driver for host to connect st link debugger hardware as device on PC's USB port.

- Debugger adapter / programming adapter  - Protocol conversion from host interface protocal ( USB)  --  to -- target interface protocol ( SWD / JTAG etc )

--------------------------------------------  All About OpenOCD -----------------------
- GDB {client} application user local host port 3333 to talk --->  OpenOCD {server} host        application --> ST link driver (USB driver for ST link debugger ) --> ST link Debugger hardware -- SWDIO &  SWDCLK (controlled by ST link debugger as master)     -->  Micro controller ( MCU ) --> Debugg Port ---> Give access to AHB bus matrix  --> Get access to FLASH memory region.

-  We have ST-Link GDB server from STM as a part of STMCube IDE application bundle similar to OpenOCD server


------------------------------------------------------------------------------------------
- In this project I have used a OpenOCD version "xpack-openocd-0.12.0-6"  and not the STM cubeIDE pluging external tool version as its more limited to the STM32 supported board 


- Some of the Open OCD command ( you acn refer - https://openocd.org/doc/html/General-Commands.html )
  IMPORTANT - if using the GDB as client you have to use a suffix - "monitor"

        To connect to OpenOCD from GDB client
        target remote localhost:3333

        - reset init 
        - flash write_image erase <elf file name>
        - reset
        - halt
        - mdw : to read the memory in word length <address>  <count>
        - bp


        You can also use the Telnet as client using port 4444 to talk with OpenOCD

C standard library
        - Newlib ( libc.a)  
        - Newlibnano(libs-nano.a)



To  run the Open OCD with semi-hosting you need to make additional changes to the make file and lnker script
        - add symbol __end__ instead of end
        - add new instructions in linker script for semi-hosting , as it doesn't need syscalls.c 
        - add the function in main.c for initializing the semihosting
                extern void initialise_monitor_handles(void);
        - after downloading the program 
                enable the semihosting 
                arm semihosting enable 
        


 HAPPY CODING :)

 
