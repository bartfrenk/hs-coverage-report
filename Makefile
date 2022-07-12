.PHONY: test

REPORT := "dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/hpc/vanilla/html/coverage-report-0.1.0.0/hpc_index.html"


help: ##
	@fgrep -h "##" $(MAKEFILE_LIST) | \
	fgrep -v fgrep | sed -e 's/: ## */##/' | column -t -s##

test: ##
	cabal test all

report/open:
	xdg-open ${REPORT}
