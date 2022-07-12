.PHONY: test

REPORT := "dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-a-test/hpc/vanilla/html/test-a-test/hpc_index.html"

help: ##
	@fgrep -h "##" $(MAKEFILE_LIST) | \
	fgrep -v fgrep | sed -e 's/: ## */##/' | column -t -s##

run: clean test report/open

clean: ##
	rm -rf dist-newstyle/build


test: ##
	cabal v2-test all


report/open:
	xdg-open ${REPORT}
