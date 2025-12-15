This project covers the Baremetal programming method for running a embedded project on the STM32F407 Cortex-M4 processor
Requisit on your system:
        -  Need to have arm-GCC tool chain
        -  GNU MAKE engine for windows


 - makefile.mak contains commands to generate the binaries from source code using arm-GCC toolchain 
        /*---------
        common syntax
        finalfile :  dependencies files
	        command  ( command can be made using a FLAGS) which are predefined
        ---------*/

- if we want to see all the symbol of the elf file 
run the command 
arm-none-eabi-nm.exe <name_of_elf_file>




- Open OCD :  Host application for programming and debugging the target 

-  St link driver - A usb driver for host to connect st link debugger hardware as device on PC's USB port.

- Debugger adapter / programming adapter  - Protocol conversion from host interface protocal ( USB)  --  to -- target interface protocol ( SWD / JTAG etc )



GDB client application port 3333 --->  OCD --> ST link driver (USB driver for ST link debugger ) --> ST link Debugger -- SWDIO                   -->  Micro controller ( MCU ) 
                                                                                                                     -- SWDCLK (controlled by ST link debugger as master) -->




 HAPPY CODING :)

 
