module Model exposing (..)

import Messages exposing (Msg)
import Routing
import Model1.Model as Model1


type alias Model =
    { route : Routing.Route
    , model1 : Model1.Model
    }


initModel : ( Model, Cmd Msg )
initModel =
    { route = Routing.Home
    , model1 = Model1.initModel
    }
        ! []
