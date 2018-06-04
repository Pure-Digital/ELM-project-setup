
## Step 1 (Bare minimum)
<hr>

### Prepare directories

```
mkdir elm
mkdir elm/src
mkdir elm/vendor
```

```
cd elm && elm package install -y
```

*In the end we should have this structure:*

* elm
  * elm-stuff
    * ...
  * src
  * vendor
  * elm-package.json

## Prepare files

```
cd src
```

#### Model

```
> Model.elm
```

Inside **Model.elm**

```ELM
module Model exposing (..)

import Messages exposing (Msg)


type alias Model =
    { noop : Bool
    }


initModel : ( Model, Cmd Msg )
initModel =
    { noop = True } ! []

```

#### Messages

```
> Messages.elm
```

Inside **Messages.elm**

```ELM
module Messages exposing (..)

type Msg
    = Noop
```

#### Update

```
> Update.elm
```

Inside **Update.elm**

```ELM
module Update exposing (..)

import Model exposing (..)
import Messages exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            model ! []

```

#### View

```
> View.elm
```

Inside **View.elm**

```ELM
module View exposing (..)

import Html exposing (..)
import Model exposing (Model)
import Messages exposing (Msg)


view : Model -> Html Msg
view model =
    div []
        [ text "Main page"
        ]
```

#### Subscriptions

```
> Subscriptions.elm
```

Inside **Subscriptions.elm**

```ELM
module Subscriptions exposing (..)

import Model exposing (..)
import Messages exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

```

#### Main

```
> Main.elm
```

Inside **Main.elm**

```ELM
module Main exposing (..)

import Model exposing (Model, initModel)
import Update exposing (update)
import View exposing (view)
import Html exposing (program)
import Subscriptions exposing (subscriptions)
import Messages exposing (Msg)


main : Program Never Model Msg
main =
    program
        { init = initModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
```

#### Testing

Go to project **root directory(elm)** and run app
```
elm reactor
xdg-open http://localhost:8000/src/Main.elm
```

You should see text *"ELM App"*

#### Your project directory tree should be like this

* elm
  * elm-stuff
    * ...
  * src
    * Main.elm
    * Messages.elm
    * Model.elm
    * Subscriptions.elm
    * Update.elm
    * View.elm
  * vendor
  * elm-package.json
