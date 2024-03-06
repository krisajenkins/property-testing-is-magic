module Main where

type Complex
  = { real :: Number
    , imaginary :: Number
    }

type User
  = { name :: String
    , age :: Int
    , gender :: Complex
    , adult :: Boolean
    }

type Department
  = { title :: String
    , members :: Array User
    }
