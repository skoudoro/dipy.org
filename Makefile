# Makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    = -W # -n -j auto
SPHINXBUILD   = sphinx-build
PAPER         =

# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d _build/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .

.PHONY: help clean html dirhtml pickle json htmlhelp qthelp latex changes linkcheck doctest

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html      to make standalone HTML files"
	@echo "  dirhtml   to make HTML files named index.html in directories"
	@echo "  pickle    to make pickle files"
	@echo "  json      to make JSON files"
	@echo "  htmlhelp  to make HTML files and a HTML help project"
	@echo "  qthelp    to make HTML files and a qthelp project"
	@echo "  latex     to make LaTeX files, you can set PAPER=a4 or PAPER=letter"
	@echo "  changes   to make an overview of all changed/added/deprecated items"
	@echo "  linkcheck to check all external links for integrity"
	@echo "  doctest   to run all doctests embedded in the documentation (if enabled)"

clean:
	-rm -rf _build/*

gitwash-update:
	python ../tools/gitwash_dumper.py devel dipy --repo-name=dipy --github-user=dipy \
            --project-url=https://dipy.org \
            --project-ml-url=https://mail.python.org/mailman/listinfo/neuroimaging

html:
	#  Standard html build after examples have been prepared
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) _build/html
	@echo
	@echo "Build finished. The HTML pages are in _build/html."

dirhtml:
	$(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) _build/dirhtml
	@echo
	@echo "Build finished. The HTML pages are in _build/dirhtml."

pickle:
	$(SPHINXBUILD) -b pickle $(ALLSPHINXOPTS) _build/pickle
	@echo
	@echo "Build finished; now you can process the pickle files."

json:
	$(SPHINXBUILD) -b json $(ALLSPHINXOPTS) _build/json
	@echo
	@echo "Build finished; now you can process the JSON files."

htmlhelp:
	$(SPHINXBUILD) -b htmlhelp $(ALLSPHINXOPTS) _build/htmlhelp
	@echo
	@echo "Build finished; now you can run HTML Help Workshop with the" \
	      ".hhp project file in _build/htmlhelp."

qthelp:
	$(SPHINXBUILD) -b qthelp $(ALLSPHINXOPTS) _build/qthelp
	@echo
	@echo "Build finished; now you can run "qcollectiongenerator" with the" \
	      ".qhcp project file in _build/qthelp, like this:"
	@echo "# qcollectiongenerator _build/qthelp/dipy.qhcp"
	@echo "To view the help file:"
	@echo "# assistant -collectionFile _build/qthelp/dipy.qhc"

latex:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) _build/latex
	@echo
	@echo "Build finished; the LaTeX files are in _build/latex."
	@echo "Run \`make all-pdf' or \`make all-ps' in that directory to" \
	      "run these through (pdf)latex."

changes:
	$(SPHINXBUILD) -b changes $(ALLSPHINXOPTS) _build/changes
	@echo
	@echo "The overview file is in _build/changes."

linkcheck:
	$(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) _build/linkcheck
	@echo
	@echo "Link check complete; look for any errors in the above output " \
	      "or in _build/linkcheck/output.txt."

doctest:
	$(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) _build/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in _build/doctest/output.txt."

codespell:
	codespell -d -q 3 --skip=".git, *.po,*.ts,_build"
