module Main (main) where

import           Test.QuickCheck
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck

import           MyLib                 (minus)
import           MyLibB                (minusB)

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Group"
  [ testProperty "add x y = add y x" prop_minusIsAlmostCommutatitive
  , testProperty "add x y = add y x" prop_minusBIsAlmostCommutatitive
  ]

prop_minusIsAlmostCommutatitive :: Int -> Int -> Property
prop_minusIsAlmostCommutatitive x y = minus x y === - minus y x

prop_minusBIsAlmostCommutatitive :: Int -> Int -> Property
prop_minusBIsAlmostCommutatitive x y = minusB x y === - minusB y x



