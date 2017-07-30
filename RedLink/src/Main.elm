module Main exposing (main)

import App
import App.Model
import App.Msg
import Html


type alias Model =
    App.Model.Model


type alias Msg =
    App.Msg.Msg


init =
    App.init


subscriptions =
    App.subscriptions


update =
    App.update


view =
    App.view


main =
    Html.program
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
