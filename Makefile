# Makefile for mod_rpaf.c (gmake)
APXS=$(shell which apxs) 

default: rpaf
	@echo mod_rpaf:
	@echo nevest version available at http://stderr.net/apache/rpaf/
	@echo
	@echo following options available:
	@echo \"make rpaf\" to compile
	@echo \"make test\" to test
	@echo \"make install\" to install
	@echo
	@echo change path to apxs if this is not it: \"$(APXS)\"


rpaf: mod_rpaf-2.0.o
	@echo make done, type \"make install\" to install mod_rpaf-2.0

mod_rpaf-2.0.o: mod_rpaf-2.0.c
	$(APXS) -c -n $@ mod_rpaf-2.0.c

mod_rpaf-2.0.c:

install: mod_rpaf-2.0.o
	$(APXS) -i -n mod_rpaf-2.0.so mod_rpaf-2.0.la

clean:
	rm -rf *~ *.o *.so *.lo *.la *.slo *.loT .libs/ 
