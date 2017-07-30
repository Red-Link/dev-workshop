module App.Model exposing (..)

import Feature


type alias Model =
    { isShowMenu : Bool
    , currentFeature : Feature.Feature
    }
