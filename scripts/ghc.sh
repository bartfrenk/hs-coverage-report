#!/bin/bash


/home/bart/.ghcup/ghc/8.10.7/bin/hpc sum --union \
                                         /home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-a-test/hpc/vanilla/tix/test-a-test/test-a-test.tix \
                                         /home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/hpc/vanilla/tix/test-b-test/test-b-test.tix \
                                         --output=coverage-report-0.1.0.0-ab.tix \
                                         --exclude=Main

/home/bart/.ghcup/ghc/8.10.7/bin/hpc sum --union /home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-a-test/hpc/vanilla/tix/test-a-test/test-a-test.tix \
                                         --output=coverage-report-0.1.0.0-a.tix \
                                         --exclude=Main


/home/bart/.ghcup/ghc/8.10.7/bin/hpc markup /home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-a-test/hpc/vanilla/tix/test-a-test/test-a-test.tix \
                                            --destdir=html/test-a \
                                            --hpcdir=dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/hpc/vanilla/mix/test-a-test \
                                            --hpcdir=dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/hpc/vanilla/mix/coverage-report-0.1.0.0 \
                                            --include=MyLib

/home/bart/.ghcup/ghc/8.10.7/bin/hpc show /home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/hpc/vanilla/tix/test-b-test/test-b-test.tix \
                                            --hpcdir=dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/hpc/vanilla/mix/test-a-test \
                                            --hpcdir=dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/hpc/vanilla/mix/test-b-test \
                                            --hpcdir=dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/hpc/vanilla/mix/coverage-report-0.1.0.0 \
                                            --include=MyLib --include=MyLibB

/home/bart/.ghcup/ghc/8.10.7/bin/hpc markup /home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/hpc/vanilla/tix/test-b-test/test-b-test.tix \
                                            --destdir=html/test-b \
                                            --hpcdir=dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/hpc/vanilla/mix/test-a-test \
                                            --hpcdir=dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/hpc/vanilla/mix/test-b-test \
                                            --hpcdir=dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/hpc/vanilla/mix/coverage-report-0.1.0.0 \
                                            --include=MyLib --include=MyLibB



/home/bart/.ghcup/bin/ghc --make -no-link -fbuilding-cabal-package -O \
                          -fhpc \
                          -hpcdir hpc/test-b \
                          -static -outputdir /home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/build/test-b-test/test-b-test-tmp \
                          -odir /home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/build/test-b-test/test-b-test-tmp \
                          -hidir /home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/build/test-b-test/test-b-test-tmp \
                          -stubdir /home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/build/test-b-test/test-b-test-tmp \
                          -i -i/home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/build/test-b-test/test-b-test-tmp \
                          -itest-b/test \
                          -i/home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/build/test-b-test/autogen \
                          -i/home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/build/global-autogen \
                          -I/home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/build/test-b-test/autogen \
                          -I/home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/build/global-autogen \
                          -I/home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/build/test-b-test/test-b-test-tmp \
                          -optP-include -optP/home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/build/test-b-test/autogen/cabal_macros.h \
                          -hide-all-packages \
                          -Wmissing-home-modules \
                          -no-user-package-db \
                          -package-db /home/bart/.cabal/store/ghc-8.10.7/package.db -package-db /home/bart/engineering/iog/coverage-report/dist-newstyle/packagedb/ghc-8.10.7 \
                          -package-db /home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/t/test-b-test/package.conf.inplace \
                          -package-id QuickCheck-2.14.2-797b47cf9dbaa4076286adc6cd5738ee22146a33d5eead9cd0e207f0511d022a \
                          -package-id base-4.14.3.0 \
                          -package-id coverage-report-0.1.0.0-inplace \
                          -package-id coverage-report-0.1.0.0-inplace-package-b \
                          -package-id tasty-1.4.2.3-d9dcf98055f6434a0e844805738490cc500ab4bc6cc3ad2686e9a0b9e5db907b \
                          -package-id tasty-hunit-0.10.0.3-20f0c090f6bd744e5292c5bbf0468eab64026e22ab1a528fdace08f1ac66bde2 \
                          -package-id tasty-quickcheck-0.10.2-6cdf8d23008032600df723e96340342f7217065850910678d03c42cc41feca98 \
                          -XHaskell2010 test-b/test/MyLibTest.hs -hide-all-packages

# /home/bart/engineering/iog/coverage-report/dist-newstyle/build/x86_64-linux/ghc-8.10.7/coverage-report-0.1.0.0/hpc/vanilla/mix/test-b-test \
