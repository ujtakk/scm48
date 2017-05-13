.PHONY: all
all:
	for i in *.hs; do \
		make `echo $$i | awk -F . '{print $$1}'`; \
	done

%: %.hs
	ghc -package parsec -fglasgow-exts -o $@ $<

.PHONY: clean
clean:
	rm -f *.o *.hi
	rm -f `for i in *.hs; do echo $$i | awk -F . '{print $$1}' ; done`
