# vim: ts=4:sts=4:sw=4:noexpandtab

.PHONY: build clean

build: rfc/index.json rfc/index.pdf rfc/index.html rfc/index.html rfc/index.txt rfc/index.xml rfc/index.txt.html

clean:
	rm -rf rfc/*

%/index.json: %.xml
	mkdir -p $*
	xml2rfc $< --v3 --info -o$@

%/index.txt: %.xml
	mkdir -p $*
	xml2rfc $< --v3 --text -o$@

%/index.pdf: %.xml
	mkdir -p $*
	xml2rfc $< --v3 --pdf -o$@

%/index.txt.html: %/index.txt
	python htmlify.py $< $@

%/index.html: %.xml
	mkdir -p $*
	xml2rfc $< --v3 --html -o$@

%/index.xml: %.xml
	mkdir -p $*
	xml2rfc $< --v3 --expand -o$@

