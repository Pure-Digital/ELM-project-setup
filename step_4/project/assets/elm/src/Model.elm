module Model exposing (..)

import Routing
import Model1.Model as Model1


type alias Model =
    { route : Routing.Route
    , model1 : Model1.Model
    , flags : Flags
    }


type alias Flags =
    { socketUrl : String
    }


initialModel : Flags -> Routing.Route -> Model
initialModel flags route =
    { route = route
    , model1 = Model1.initModel
    , flags = flags
    }
