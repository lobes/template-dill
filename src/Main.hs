module Main where

import Network.HTTP.Types (status200)
import Network.Wai (Response, responseLBS)
import Network.Wai.Handler.Warp qualified as Warp

application :: forall {p} {b}. p -> (Response -> b) -> b
application _ respond =
  respond $
    responseLBS status200 [("Content-Type", "text/plain")] "Hello World"

main :: IO ()
main = Warp.run 3000 application

-- todo: figure out a way to turn elm part into a flake that plays nice with the api
-- todo: look into postgres for the datastore