# The MIT License (MIT)
#
# Copyright (c) 2015-2016 Thomas "Ventto" Venriès <thomas.venries@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
THEME      := Papirus
BACKGROUND := background.png
THEMEDIR   := ../themes/$(THEME)
QRCFILE    := $(THEME)/$(THEME).qrc
RCCFILE    := $(THEMEDIR)/$(THEME).rcc
ICONSDIR = $(THEME)/$(THEME)
ICONS    = $(wildcard $(ICONSDIR)/*.svg)
PNGICONS = $(ICONS:.svg=.png)

all: $(RCCFILE)

$(RCCFILE): $(QRCFILE) $(THEMEDIR)
	rcc -binary $< -o $@

$(THEMEDIR):
	mkdir -p $@

$(QRCFILE): $(PNGICONS)
	[ -f "$(BACKGROUND)" ] && cp "$(BACKGROUND)" "$(ICONSDIR)/background.png"
	@echo '<RCC>' > $@
	@echo '    <qresource prefix="/">' >> $@
	@for ico in `find "$(ICONSDIR)" -type f -name "*.png" -exec basename {} \;`; do \
		echo "        <file>$(THEME)/$$ico</file>" >> $@; \
	done
	@echo '    </qresource>' >> $@
	@echo '</RCC>' >> $@

%.png: %.svg
	rsvg-convert -f png "$<" -o "$@"

clean:
	$(RM) $(QRCFILE) $(PNGICONS)

distclean: clean
	$(RM) $(THEMEDIR)

.PHONY: all clean
