module Main where

import Prelude (Unit, bind)
import DOM (DOM)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Signal.Channel (CHANNEL)
import Pux (renderToDOM, fromSimple, start)
import App.Counter as Counter

type AppEffects = (dom :: DOM)

main :: forall e. Eff (err :: EXCEPTION, channel :: CHANNEL | e) Unit
main = do
  app <- start
    { initialState: Counter.init
    , update: fromSimple Counter.update
    , view: Counter.view
    , inputs: []
    }

  renderToDOM "#app" app.html  