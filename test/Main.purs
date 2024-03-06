module Test.Main where

import Prelude

import Data.Either (Either(..))
import Debug (spy)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Main (User, Department)
import Simple.JSON (readJSON, writeJSON)
import Test.QuickCheck ((===))
import Test.Spec (describe, it)
import Test.Spec.QuickCheck (quickCheck)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)

main :: Effect Unit
main =
  launchAff_ $ runSpec [ consoleReporter ]
    $ describe "JSON roundtrips always work" do
        it "Main.User" do
          quickCheck
            ( \(user :: User) ->
                readJSON (spy "Raw" (writeJSON user))
                  === (Right user)
            )
        it "Main.Department" do
          quickCheck
            ( \(department :: Department) ->
                readJSON (spy "Raw" (writeJSON department))
                  === (Right department)
            )
