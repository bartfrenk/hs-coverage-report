.PHONY: test

BASE = dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0
TEST_A_HTML := "/t/test-a-test/hpc/vanilla/html/test-a-test/hpc_index.html"
TEST_B_HTML := "/t/test-b-test/hpc/vanilla/html/test-b-test/hpc_index.html"

TEST_A_TIX := "/t/test-a-test/hpc/vanilla/tix/test-a-test/test-a-test.tix"
TEST_B_TIX := "/t/test-b-test/hpc/vanilla/tix/test-b-test/test-b-test.tix"

BUILDDIR =  dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0
TARGETDIR = ${BUILDDIR}/hpc/vanilla
MIXDIR = ${TARGETDIR}/mix
TIXDIR = ${TARGETDIR}/tix
LIBDIR = ${BUILDDIR}/l
TIX = ${BUILDDIR}/t/test-a-test/hpc/vanilla/tix/coverage-report-0.1.0.0/coverage-report-0.1.0.0.tix ${BUILDDIR}/t/test-b-test/hpc/vanilla/tix/coverage-report-0.1.0.0/coverage-report-0.1.0.0.tix
REPORTDIR = reports/html

bla:
	echo ${TIX}


help: ##
	@fgrep -h "##" $(MAKEFILE_LIST) | \
	fgrep -v fgrep | sed -e 's/: ## */##/' | column -t -s##

clean: ##
	rm -rf dist-newstyle/build

test: ##
	cabal v2-test all -v3

# report/complete.tix: report
# 	hpc combine ${BASE}${TEST_A_TIX} ${BASE}${TEST_B_TIX} --output $@ --verbosity 2

report/open:
	xdg-open ${BASE}${TEST_A_HTML}
	xdg-open ${BASE}${TEST_B_HTML}

.PHONY: inputs
inputs: ${MIXDIR}/coverage-report-0.1.0.0/coverage-report-0.1.0.0-inplace-package-b ${TIXDIR}/coverage-report-0.1.0.0/coverage-report-0.1.0.0.tix

${MIXDIR}/coverage-report-0.1.0.0/coverage-report-0.1.0.0-inplace-package-b:
	mkdir -p $@
	cp -r ${LIBDIR}/package-b/hpc/vanilla/mix/coverage-report-0.1.0.0/coverage-report-0.1.0.0-inplace-package-b/* $@

${TIXDIR}/coverage-report-0.1.0.0/coverage-report-0.1.0.0.tix: ${TIXDIR}/coverage-report-0.1.0.0
	hpc sum --union ${TIX} --output=$@ --exclude=Main

${TIXDIR}/coverage-report-0.1.0.0:
	mkdir -p $@

show: inputs
	hpc show ${TIXDIR}/coverage-report-0.1.0.0/coverage-report-0.1.0.0.tix \
             --hpcdir=${MIXDIR}/test-a-test \
             --hpcdir=${MIXDIR}/test-b-test \
             --hpcdir=${MIXDIR}/coverage-report-0.1.0.0 \
             --include=MyLib --include=MyLibB

