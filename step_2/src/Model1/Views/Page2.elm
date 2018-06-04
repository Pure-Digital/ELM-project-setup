module Model1.Views.Page2 exposing (..)

import Html exposing (..)
import Model1.Model exposing (Model)
import Model1.Messages exposing (..)
import Html.Events exposing (onClick)
import Model1.Routing as Routing


page2 : Model -> Html Msg
page2 model =
    div []
        [ h1 [] [ text "Model 1. Page 2" ]
        , button [ onClick <| ChangeRoute Routing.Page1 ] [ text "To Model 1. Page 2" ]
        ]
