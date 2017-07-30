module App.Msg exposing (..)

import Feature


type Msg
    = ShowMenu
    | CloseMenu
    | ClickFeature Feature.Feature
