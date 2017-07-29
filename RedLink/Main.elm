module Main exposing (..)

import Html exposing (Html, body, div, h1, li, node, span, text, ul)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Svg exposing (svg)
import Svg.Attributes
import Theme exposing (..)


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
        [ appStyle ]
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
        [ headerText "Red-Link"
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


headerText content =
    span
        [ style
            [ ( "color", "white" )
            , ( "font-weight", "bold" )
            , ( "line-height", toString headerHeight ++ "px" )
            , ( "vertical-align", "center" )
            ]
        ]
        [ text content ]


headerStyle =
    style
        [ ( "background-color", backgroundColor )
        , ( "display", "block" )
        , ( "height", toString headerHeight ++ "px" )
        , ( "padding-left", "4px" )
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
        [ style
            [ ( "background-color", backgroundColor )
            , ( "height", "100%" )
            , ( "margin", "0" )
            , ( "margin-bottom", toString headerHeight ++ "px" )
            , ( "display", "flex" )
            , ( "flex-direction", "row" )
            , ( "align-items", "center" )
            ]
        ]
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
