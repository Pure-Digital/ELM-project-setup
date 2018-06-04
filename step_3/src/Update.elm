module Update exposing (..)

import Model exposing (..)
import Messages exposing (..)
import Model1.Update as Model1Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeRoute route ->
            { model | route = route } ! []

        Model1Msg msg ->
            let
                ( newModel1, cmdMsg1 ) =
                    Model1Update.update msg model.model1
            in
                { model | model1 = newModel1 } ! [ Cmd.map Model1Msg cmdMsg1 ]
