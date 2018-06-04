module Model1.Views.Page1 exposing (..)

import Html exposing (..)
import Model1.Model exposing (Model)
import Model1.Messages exposing (..)
import Html.Events exposing (onClick)
import Model1.Routing as Routing


page1 : Model -> Html Msg
page1 model =
    div []
        [ h1 [] [ text "Model 1. Page 1" ]
        , button [ onClick <| ChangeRoute Routing.Page2 ] [ text "To Model 1. Page 2" ]
        ]
