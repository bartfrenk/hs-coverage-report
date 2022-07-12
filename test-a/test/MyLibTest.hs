module Main (main) where

import           Test.QuickCheck
import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.QuickCheck

import           MyLib                 (add)

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testProperty "add x y = add y x" prop_addIsCommutatitive


prop_addIsCommutatitive :: Int -> Int -> Property
prop_addIsCommutatitive x y = add x y === add y x



