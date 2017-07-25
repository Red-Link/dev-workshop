module Main exposing (..)

import Html exposing (Html, body, div, h1, node, span, text)
import Html.Attributes exposing (style)


type alias Model =
    {}


type Msg
    = Msg


initModel : Model
initModel =
    {}


init =
    initModel ! []


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    model ! []


view : Model -> Html Msg
view model =
    node "app"
        [ appStyle ]
        [ viewHeader model
        ]


appStyle =
    style
        [ ( "display", "block" )
        , ( "padding", "8px" )
          --, ( "width", "100%" )
          --, ( "height", "100%" )
        ]


viewHeader model =
    node "header"
        [ headerStyle ]
        [ headerText "Red-Link"
        , menuButton model
        ]


headerText content =
    span
        [ style
            [ ( "color", "white" )
            , ( "font-weight", "bold" )
            , ( "font-family", "sans-serif" )
            ]
        ]
        [ text content ]


headerStyle =
    style [ ( "background-color", "red" ) ]


menuButton model =
    node "menuButton"
        [ style [ ( "background-color", "pink" ) ] ]
        (List.repeat 3
            (div
                [ style
                    [ ( "margin", "4px 8px" )
                    , ( "background-color", "white" )
                    , ( "width", "20px" )
                    , ( "height", "4px" )
                    ]
                ]
                []
            )
        )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main =
    Html.program
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
