module Messages exposing (..)

import Routing
import Model1.Messages as Model1Messages


type Msg
    = ChangeRoute Routing.Route
    | Model1Msg Model1Messages.Msg
