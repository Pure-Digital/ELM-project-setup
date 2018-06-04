module Model1.Model exposing (..)

import Model1.Routing as Routing


type alias Model =
    { route : Routing.Routing
    }


initModel : Model
initModel =
    { route = Routing.Page1
    }
