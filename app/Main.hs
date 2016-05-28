{-# LANGUAGE TemplateHaskell #-}

module Main where

import           Control.Lens
import           Control.Monad.State
import           Text.Printf

data Vehicle = Vehicle
    { _manufacturer :: String
    , _model        :: String
    , _horsepower   :: Int
    , _coords       :: (Double, Double)
    } deriving (Eq)

makeLenses ''Vehicle

instance Show Vehicle where
    show e = printf
               "%s %s, %d hp"
               (e^.manufacturer)
               (e^.model)
               (e^.horsepower)


pinto :: Vehicle
pinto = Vehicle "Ford" "Pinto" 89 (0,0)

enzo :: Vehicle
enzo = flip execState pinto $ do
            manufacturer .= "Ferrari"
            model .= "Enzo"
            horsepower .= 650
            horsepower += 1

main :: IO ()
main = do
    print pinto
    print enzo
