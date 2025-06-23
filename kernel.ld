/* This code use by linker to know how/where programs memory defined*/
/* The entry point of the kernel is the boot function*/
ENTRY(boot)

/* define memory section */
SECTIONS {
	. = 0x80200000; /*base address, program start at here*/

	.text :{
		KEEP(*(.text.boot)); /*alwats placed at the beginning*/
		*(.text .text.*);
	}

	.rodata : ALIGN(4) { /*ensures the current address is adjusted to a 4-byte boundary*/
		*(.rodata .rodata.*);
	}

	.data : ALIGN(4) { /*memory for init variable*/
		*(.data .data.*);
	}

	.bss : ALIGN(4) { /*Block started by symbol, memory for non-init variable*/
		__bss = .;
		*(.bss .bss.* .sbss .sbss.*);
		__bss_end = .;
	}

	. = ALIGN(4);
	. += 128 * 1024; /* Move foward by 128KB */
	__stack_top = .; /* Store current address location in symbol*/
}
