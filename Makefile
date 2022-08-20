SIMPLE_MACROS_SOURCE = src/simple-macros.json
MACROS_KATEX = _includes/simple-macros.katex.json
MACROS_ANTEX = antex-macros/simple-macros.sty
MACROS_ALL = $(MACROS_KATEX) $(MACROS_ANTEX)

.PHONY: macros
macros: $(MACROS_ALL)

.PHONY: clean
clean:
	rm $(MACROS_ALL)

$(MACROS_KATEX): $(SIMPLE_MACROS_SOURCE)
	cat $< | bin/macro-json-to-katex.sh > $@

$(MACROS_ANTEX): $(SIMPLE_MACROS_SOURCE)
	cat $< | bin/macro-json-to-antex.sh > $@
