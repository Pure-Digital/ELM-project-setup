module View exposing (..)

import Html exposing (..)
import Model exposing (Model)
import Messages exposing (..)
import Routing
import Model1.View as Model1View
import Html.Events exposing (onClick)
import Layouts.Error as LayoutsError


-- import


view : Model -> Html Msg
view model =
    case model.route of
        Routing.Home ->
            home model

        Routing.Model1 ->
            Model1View.view model.model1
                |> Html.map Model1Msg

        Routing.Error ->
            LayoutsError.error model


home : Model -> Html Msg
home model =
    div []
        [ text "Main page"
        , button [ onClick <| ChangeRoute Routing.Model1 ] [ text "Model1 pages" ]
        ]
