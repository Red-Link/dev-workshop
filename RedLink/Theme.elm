module Theme exposing (..)

import Html.Attributes exposing (style)


appStyle =
    style
        [ ( "display", "block" )
        , ( "max-height", "100%" )
        , ( "overflow", "hidden" )
        , ( "font-family", "sans-serif" )
        ]


backgroundColor =
    "red"


headerHeight =
    28
