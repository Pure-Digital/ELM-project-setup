module Main exposing (..)

import Model exposing (..)
import Update exposing (update)
import View exposing (view)
import Subscriptions exposing (subscriptions)
import Messages exposing (Msg)
import Navigation
import Routing


initModel : Flags -> Navigation.Location -> ( Model, Cmd Msg )
initModel flags location =
    let
        newModel =
            initialModel flags <| Routing.parser location
    in
        newModel ! []


main : Program Flags Model Msg
main =
    Navigation.programWithFlags Messages.UrlChange
        { init = initModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
