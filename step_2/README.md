## Step 2 (Child model and simple routing)
<hr>

#### Create Model1 directory

```
mkdir src/Model1 && cd src/Model1
```

#### Routing

Here will be our routing *(all pages in this module)*

```
> Routing.elm
```

Inside **Routing.elm**

```ELM
module Model1.Routing exposing (..)


type Routing
    = Page1
    | Page2

```

#### Messages

Here we will create message which will change our routes

```
> Messages.elm
```

Inside **Messages.elm**

```ELM
module Model1.Messages exposing (..)

import Model1.Routing as Routing


type Msg
    = ChangeRoute Routing.Routing

```

#### Model

Here we create Model with field which will contain state our our current route

```
> Model.elm
```

```ELM
module Model1.Model exposing (..)

import Model1.Routing as Routing


type alias Model =
    { route : Routing.Routing
    }


initModel : Model
initModel =
    { route = Routing.Page1
    }

```

#### Update

Here we create Update with message which will change Model route state *(page switcher)*

```
> Update.elm
```

```ELM
module Model1.Update exposing (..)

import Model1.Model exposing (..)
import Model1.Messages exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeRoute route ->
            { model | route = route } ! []

```

#### Views

Here will be all our pages in this module

```
mkdir Views && cd Views
```

#### Page 1

```
> Page1.elm
```

```ELM
module Model1.Views.Page1 exposing (..)

import Html exposing (..)
import Model1.Model exposing (Model)
import Model1.Messages exposing (..)
import Html.Events exposing (onClick)
import Model1.Routing as Routing


page1 : Model -> Html Msg
page1 model =
    div []
        [ h1 [] [ text "Model 1. Page 2" ]
        , button [ onClick <| ChangeRoute Routing.Page2 ] [ text "To Model 1. Page 2" ]
        ]

```

#### Page 2

```
> Page2.elm
```

```ELM
module Model1.Views.Page2 exposing (..)

import Html exposing (..)
import Model1.Model exposing (Model)
import Model1.Messages exposing (..)
import Html.Events exposing (onClick)
import Model1.Routing as Routing


page2 : Model -> Html Msg
page2 model =
    div []
        [ h1 [] [ text "Model 1. Page 1" ]
        , button [ onClick <| ChangeRoute Routing.Page1 ] [ text "To Model 1. Page 2" ]
        ]

```

#### Main View

```
cd ..
> View.elm
```

```ELM
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

```


#### Your project directory tree should be like this

* elm
  * elm-stuff
    * ...
  * src
    * Model1
      * Views
        * Page1.elm
        * Page2.elm
      * Messages.elm
      * Model.elm
      * Routing.elm
      * Update.elm
      * View.elm
    * Main.elm
    * Messages.elm
    * Model.elm
    * Subscriptions.elm
    * Update.elm
    * View.elm
  * vendor
  * elm-package.json
