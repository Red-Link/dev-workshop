module AppLayout exposing (..)

import AppTheme
import Html exposing (span, text)
import Html.Attributes exposing (style)
import Style exposing (..)


full =
    "100%"


zero =
    "0"


standardGap =
    4


standardGapUnit =
    px standardGap


headerHeight_ =
    28


fontBold =
    fontWeight "bold"


headerHeightUnit =
    px headerHeight_


headerTextLayout =
    [ color AppTheme.textColor
    , fontBold
    , lineHeight headerHeightUnit
    , verticalAlign center
    ]


headerText content =
    span [ style headerTextLayout ] [ text content ]


headerLayout =
    [ backgroundColor AppTheme.backgroundColor
    , display block
    , height headerHeightUnit
    , paddingLeft standardGapUnit
    ]


appLayout =
    [ display block
    , maxHeight full
    , overflow hidden
    , fontFamily "sans-serif"
    ]


menuLayout =
    [ backgroundColor AppTheme.backgroundColor
    , height full
    , margin zero
    , marginBottom headerHeightUnit
    , display flex_
    , flexDirection row
    , alignItems center
    ]
