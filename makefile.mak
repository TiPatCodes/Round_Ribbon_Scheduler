CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -O0
LDFLAGS= -nonstdlib -T stm32_linkerscript.ld -Map=final.map 

all main.o led_onbord.o stm32_startupcode.o finalmake.elf



main.o:main.c
	$(CC) $(CFLAGS) $^ -o $@

led_onbord.o:led_onbord.c
	$(CC) $(CFLAGS) $^ -o $@

stm32_startupcode.o:stm32_startupcode.c
	$(CC) $(CFLAGS) $^ -o $@

stm32_startupcode.o:stm32_startupcode.c
	$(CC) $(CFLAGS) $^ -o $@

finalmake.elf: main.o led_onbord.o stm32_startupcode.O
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	del main.o led_onbord.o stm32_startupcode.o  finalmake.elf




