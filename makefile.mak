CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -O0

main.o:main.c
	$(CC) $(CFLAGS) $^ -o $@

led_onbord.o:led_onbord.c
	$(CC) $(CFLAGS) $^ -o $@

stm32_startupcode.o:stm32_startupcode.c
	$(CC) $(CFLAGS) $^ -o $@


clean:
	del main.o 