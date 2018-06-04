## Step 3 (Adding Child model to main Model)
<hr>

### We need to create main routing

```
cd elm
```

#### Routing

```
> Routing.elm
```

Inside **Routing.elm**

```ELM
module Routing exposing (..)


type Route
    = Model1
    | Home

```

#### Modify Model

Inside **Model.elm**

```ELM
module Model exposing (..)

import Messages exposing (Msg)
import Routing


type alias Model =
    { route : Routing.Route
    }


initModel : ( Model, Cmd Msg )
initModel =
    { route = Routing.Home
    }
        ! []

```

#### Modify Messages

```ELM
module Messages exposing (..)

import Routing


type Msg
    = ChangeRoute Routing.Route

```

#### Modify Update

```ELM
module Update exposing (..)

import Model exposing (..)
import Messages exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeRoute route ->
            { model | route = route } ! []

```

#### Adding Model1 to Model

##### Modify Model

```ELM
module Model exposing (..)

import Messages exposing (Msg)
import Routing
import Model1.Model as Model1


type alias Model =
    { route : Routing.Route
    , model1 : Model1.Model
    }


initModel : ( Model, Cmd Msg )
initModel =
    { route = Routing.Home
    , model1 = Model1.initModel
    }
        ! []

```

##### Modify Messages

```ELM
module Messages exposing (..)

import Routing
import Model1.Messages as Model1Messages


type Msg
    = ChangeRoute Routing.Route
    | Model1Msg Model1Messages.Msg

```

##### Modify Update

```ELM
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


-- import


view : Model -> Html Msg
view model =
    case model.route of
        Routing.Home ->
            home model

        Routing.Model1 ->
            Model1View.view model.model1
                |> Html.map Model1Msg


home : Model -> Html Msg
home model =
    div []
        [ text "Main page"
        , button [ onClick <| ChangeRoute Routing.Model1 ] [ text "Model1 pages" ]
        ]


```

#### Testing

Go to project **root directory(elm)** and run app
```
elm reactor
xdg-open http://localhost:8000/src/Main.elm
```
