ENTRY(Reset_Handler) 


MEMORY
{
    FLASH(rx):ORIGIN =0x08000000,LENGTH=1024K
    SRAM1(rwx):ORIGIN =0x20000000,LENGTH=116K
    SRAM2(rwx):ORIGIN =0x20000000+116K-4,LENGTH=16K
}




SECTIONS
{
    
    .text :
    {
        
        (.isr_vector)

        *(.text)
        *(.text.*)
        *(.init)
        *(.finish)
        *(.rodata)

        . = ALIGN(4);
        _etext = .;

    }>FLASH  AT> FLASH  

    _la_data =  LOADADDR(.data);
    
    .data :
    {
        _sdata = .;
        *(.data)
        . = ALIGN(4);
        _edata = .;


    }>SRAM1  AT> FLASH

    .bss :
    {   
        _sbss = .;
        *(.bss)
        *(.COMMON)
        . = ALIGN(4);
        _ebss = .;
        __bss_end__ =  _ebss;
        . = ALIGN(4);
        end = .;

    }>SRAM1  AT> SRAM1


}


