module Messages exposing (..)

import Routing
import Model1.Messages as Model1Messages
import Navigation


type Msg
    = ChangeRoute Routing.Route
    | UrlChange Navigation.Location
    | Model1Msg Model1Messages.Msg
