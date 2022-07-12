.PHONY: test

BASE = dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0
TEST_A_HTML := "/t/test-a-test/hpc/vanilla/html/test-a-test/hpc_index.html"
TEST_B_HTML := "/t/test-b-test/hpc/vanilla/html/test-b-test/hpc_index.html"

TEST_A_TIX := "/t/test-a-test/hpc/vanilla/tix/test-a-test/test-a-test.tix"
TEST_B_TIX := "/t/test-b-test/hpc/vanilla/tix/test-b-test/test-b-test.tix"

help: ##
	@fgrep -h "##" $(MAKEFILE_LIST) | \
	fgrep -v fgrep | sed -e 's/: ## */##/' | column -t -s##

run: clean test report/open

clean: ##
	rm -rf dist-newstyle/build

test: ##
	cabal v2-test all

# report/complete.tix: report
# 	hpc combine ${BASE}${TEST_A_TIX} ${BASE}${TEST_B_TIX} --output $@ --verbosity 2

report/open:
	xdg-open ${BASE}${TEST_A_HTML}
	xdg-open ${BASE}${TEST_B_HTML}

# report:
# 	mkdir -p report
