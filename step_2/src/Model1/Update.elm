module Model1.Update exposing (..)

import Model1.Model exposing (..)
import Model1.Messages exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeRoute route ->
            { model | route = route } ! []
