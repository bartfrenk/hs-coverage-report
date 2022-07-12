module Main (main) where

import           Test.QuickCheck
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck

import           MyLib                 (minus)

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testProperty "add x y = add y x" prop_minusIsAlmostCommutatitive


prop_minusIsAlmostCommutatitive :: Int -> Int -> Property
prop_minusIsAlmostCommutatitive x y = minus x y === - minus y x



