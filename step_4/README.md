## Step 4 (UrlParser, Flags, Error 404)
<hr>

> You need backend to work with it
> In our case it will be Elixir(Phoenix) backend

#### Install dependencies

```
elm package install elm-lang/navigation -y
elm package install evancz/url-parser -y
```

#### Add scoket flags

##### Modify Model

```ELM
module Model exposing (..)

import Routing
import Model1.Model as Model1


type alias Model =
    { route : Routing.Route
    , model1 : Model1.Model
    , flags : Flags
    }


type alias Flags =
    { socketUrl : String
    }


initialModel : Flags -> Routing.Route -> Model
initialModel flags route =
    { route = route
    , model1 = Model1.initModel
    , flags = flags
    }

```

##### Modify Main

```ELM
module Main exposing (..)

import Model exposing (..)
import Update exposing (update)
import View exposing (view)
import Subscriptions exposing (subscriptions)
import Messages exposing (Msg)
import Navigation
import Routing


initModel : Flags -> Navigation.Location -> ( Model, Cmd Msg )
initModel flags location =
    let
        newModel =
            initialModel flags <| Routing.parser location
    in
        newModel ! []


main : Program Flags Model Msg
main =
    Navigation.programWithFlags Messages.UrlChange
        { init = initModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

```

##### Modify Messages

```ELM
module Messages exposing (..)

import Routing
import Model1.Messages as Model1Messages
import Navigation


type Msg
    = ChangeRoute Routing.Route
    | UrlChange Navigation.Location
    | Model1Msg Model1Messages.Msg

```

##### Modify Routing

```ELM
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

```

##### Modify Update

```ELM
module Update exposing (..)

import Model exposing (..)
import Messages exposing (..)
import Model1.Update as Model1Update
import Routing


urlUpdate : Model -> ( Model, Cmd Msg )
urlUpdate model =
    case model.route of
        _ ->
            model ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            let
                newRoute =
                    Routing.parser location
            in
                urlUpdate { model | route = newRoute }

        ChangeRoute route ->
            { model | route = route } ! []

        Model1Msg msg ->
            let
                ( newModel1, cmdMsg1 ) =
                    Model1Update.update msg model.model1
            in
                { model | model1 = newModel1 } ! [ Cmd.map Model1Msg cmdMsg1 ]

```

##### Create layouts (Error 404)

```
mkdir src/Layouts
```

```
> src/Layouts/Error.elm
```

```ELM
module Layouts.Error exposing (..)

import Html exposing (..)
import Model exposing (Model)
import Messages exposing (Msg)


error : Model -> Html Msg
error model =
    h1 [] [ text "ERROR 404" ]

```

##### Modify View

```ELM
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

```

#### Testing

Go to project **root directory** and run app
```
mix phx.server
xdg-open http://localhost:4000
```
