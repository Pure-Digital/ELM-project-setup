module Model exposing (..)

import Messages exposing (Msg)


type alias Model =
    { noop : Bool
    }


initModel : ( Model, Cmd Msg )
initModel =
    { noop = True } ! []
