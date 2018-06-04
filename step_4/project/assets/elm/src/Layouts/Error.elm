module Layouts.Error exposing (..)

import Html exposing (..)
import Model exposing (Model)
import Messages exposing (Msg)


error : Model -> Html Msg
error model =
    h1 [] [ text "ERROR 404" ]
