.PHONY: test help clean inputs show markup

BUILDDIR =  dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0
TARGETDIR = ${BUILDDIR}/hpc/vanilla
MIXDIR = ${TARGETDIR}/mix
TIXDIR = ${TARGETDIR}/tix
LIBDIR = ${BUILDDIR}/l
TIX = ${BUILDDIR}/t/test-a-test/hpc/vanilla/tix/coverage-report-0.1.0.0/coverage-report-0.1.0.0.tix ${BUILDDIR}/t/test-b-test/hpc/vanilla/tix/coverage-report-0.1.0.0/coverage-report-0.1.0.0.tix
REPORTDIR = reports/html


help: ##
	@fgrep -h "##" $(MAKEFILE_LIST) | \
	fgrep -v fgrep | sed -e 's/: ## */##/' | column -t -s##

clean: ##
	cabal clean
	rm reports -rf

test: ##
# Cabal fails since it is not able to generate the coverage reports,
# although the required mix and tix files are generated.
	-cabal v2-test all

inputs: test ${MIXDIR}/coverage-report-0.1.0.0/coverage-report-0.1.0.0-inplace-package-b ${TIXDIR}/coverage-report-0.1.0.0/coverage-report-0.1.0.0.tix

${MIXDIR}/coverage-report-0.1.0.0/coverage-report-0.1.0.0-inplace-package-b:
	mkdir -p $@
	cp -r ${LIBDIR}/package-b/hpc/vanilla/mix/coverage-report-0.1.0.0/coverage-report-0.1.0.0-inplace-package-b/* $@

${TIXDIR}/coverage-report-0.1.0.0/coverage-report-0.1.0.0.tix: ${TIXDIR}/coverage-report-0.1.0.0
	hpc sum --union ${TIX} --output=$@ --exclude=Main

${TIXDIR}/coverage-report-0.1.0.0:
	mkdir -p $@

show: ## Generate hpc show output
show: inputs
	hpc show ${TIXDIR}/coverage-report-0.1.0.0/coverage-report-0.1.0.0.tix \
             --hpcdir=${MIXDIR}/test-a-test \
             --hpcdir=${MIXDIR}/test-b-test \
             --hpcdir=${MIXDIR}/coverage-report-0.1.0.0 \
             --include=MyLib --include=MyLibB

markup: ## Create hpc HTML report
markup: inputs reports/html
	hpc markup ${TIXDIR}/coverage-report-0.1.0.0/coverage-report-0.1.0.0.tix \
	           --destdir=reports/html \
	           --hpcdir=${MIXDIR}/test-a-test \
	           --hpcdir=${MIXDIR}/test-b-test \
	           --hpcdir=${MIXDIR}/coverage-report-0.1.0.0 \
	           --include=MyLib --include=MyLibB

reports/html:
	mkdir -p $@
