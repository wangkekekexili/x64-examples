build: *.asm
	for asm_file in *.asm ; do \
		target="$${asm_file%.*}" ; \
		nasm -f macho64 -o "$$target.o" "$$asm_file" ; \
	    ld -o "$$target" "$$target.o" ; \
	done

clean:
	rm -f *.o
	find . -perm +111 -type f -delete
