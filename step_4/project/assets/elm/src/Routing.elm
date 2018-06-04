module Routing exposing (..)

import Navigation exposing (..)
import UrlParser exposing (..)


type Route
    = Model1
    | Home
    | Error


toPath : Route -> String
toPath route =
    case route of
        Model1 ->
            "/model-1"

        Home ->
            "/"

        Error ->
            "/error-404"


matcher : Parser (Route -> a) a
matcher =
    oneOf
        [ UrlParser.map Home <| UrlParser.s ""
        , UrlParser.map Model1 <| UrlParser.s "model-1"
        , UrlParser.map Error <| UrlParser.s "error-404"
        ]


parser : Navigation.Location -> Route
parser location =
    case UrlParser.parsePath matcher location of
        Just sth ->
            sth

        Nothing ->
            Error
