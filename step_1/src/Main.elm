module Main exposing (..)

import Model exposing (Model, initModel)
import Update exposing (update)
import View exposing (view)
import Html exposing (program)
import Subscriptions exposing (subscriptions)
import Messages exposing (Msg)


main : Program Never Model Msg
main =
    program
        { init = initModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
