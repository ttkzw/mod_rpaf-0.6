# Makefile for mod_rpaf.c (gmake)
APXS=$(shell which apxs || which apxs2) 
LIBEXECDIR=$(shell $(APXS) -q LIBEXECDIR)

default: rpaf

rpaf: mod_rpaf-2.0.la

mod_rpaf-2.0.la: mod_rpaf-2.0.c
	$(APXS) -c -n $@ mod_rpaf-2.0.c

mod_rpaf-2.0.c:

install: mod_rpaf-2.0.la
	test -f ${LIBEXECDIR}/mod_rpaf-2.0.so && mv ${LIBEXECDIR}/mod_rpaf-2.0.so{,.bak}; true
	$(APXS) -i -n mod_rpaf-2.0.so mod_rpaf-2.0.la

clean:
	rm -rf *~ *.o *.so *.lo *.la *.slo *.loT .libs/ 
