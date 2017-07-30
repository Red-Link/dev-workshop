module Main exposing (..)

import App
import Html exposing (Html, body, div, h1, li, node, span, text, ul)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Svg exposing (svg)
import Svg.Attributes
import AppLayout
import Style exposing (..)


type alias Model =
    { isShowMenu : Bool
    }


type Msg
    = ShowMenu
    | CloseMenu


initModel : Model
initModel =
    { isShowMenu = False }


init =
    initModel ! []


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ShowMenu ->
            { model | isShowMenu = True } ! []

        CloseMenu ->
            { model | isShowMenu = False } ! []


view : Model -> Html Msg
view model =
    node "app"
        [ style AppLayout.appLayout ]
        (if model.isShowMenu then
            [ viewHeader model
            , viewMenu model
            ]
         else
            [ viewHeader model
            ]
        )


viewHeader model =
    node "header"
        [ headerStyle ]
        [ AppLayout.headerText App.name
        , let
            theStyle =
                style
                    [ ( "display", "block" )
                    , ( "float", "right" )
                    ]
          in
            if model.isShowMenu then
                node "cross"
                    [ theStyle
                    , onClick CloseMenu
                    ]
                    [ crossSvg ]
            else
                node "menuButton"
                    [ theStyle
                    , onClick ShowMenu
                    ]
                    menuLines
        ]


crossSvg =
    svg
        [ Svg.Attributes.width "28"
        , Svg.Attributes.height "28"
        , Svg.Attributes.viewBox "0 0 28 28"
        ]
        (let
            showLine startX startY endX endY =
                Svg.line
                    [ Svg.Attributes.fill "none"
                    , Svg.Attributes.stroke "white"
                    , Svg.Attributes.strokeWidth "4"
                    , Svg.Attributes.x1 (toString startX)
                    , Svg.Attributes.y1 (toString startY)
                    , Svg.Attributes.x2 (toString endX)
                    , Svg.Attributes.y2 (toString endY)
                    ]
                    []
         in
            [ showLine 4 4 24 24
            , showLine 4 24 24 4
            ]
        )


menuLines =
    List.repeat 3
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


viewMenu model =
    node "menu"
        [ style AppLayout.menuLayout ]
        [ ul
            [ style
                [ ( "list-style-type", "none" )
                , ( "margin", "0" )
                ]
            ]
            (let
                showItem isLast content =
                    li
                        [ style
                            [ ( "font-size", "xx-large" )
                            , ( "padding", "8px" )
                            , ( "margin-bottom"
                              , if isLast then
                                    "0"
                                else
                                    "1.25em"
                              )
                            , ( "color", "white" )
                            , ( "font-weight", "bold" )
                            ]
                        ]
                        [ text content ]
             in
                [ showItem False "Fate Angle"
                , showItem False "Love Formula"
                , showItem False "Secrete Wall"
                , showItem False "Draw & Guess"
                , showItem True "Events"
                ]
            )
        ]


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
