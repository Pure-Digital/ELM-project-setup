module Model1.View exposing (..)

import Html exposing (Html)
import Model1.Model exposing (Model)
import Model1.Messages exposing (Msg)
import Model1.Routing as Routing


-- Import pages

import Model1.Views.Page1 as Page1
import Model1.Views.Page2 as Page2


view : Model -> Html Msg
view model =
    case model.route of
        Routing.Page1 ->
            Page1.page1 model

        Routing.Page2 ->
            Page2.page2 model
