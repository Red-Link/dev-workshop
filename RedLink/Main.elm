module Main exposing (..)

import Html exposing (Html, body, div, h1, li, node, span, text, ul)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Svg exposing (svg)
import Svg.Attributes


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


appStyle =
    style
        [ ( "display", "block" )
          --, ( "padding", "8px" )
          --, ( "width", "100%" )
          --, ( "height", "100%" )
        ]


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
            , ( "font-family", "sans-serif" )
            , ( "line-height", "28px" )
            , ( "vertical-align", "center" )
            ]
        ]
        [ text content ]


headerStyle =
    style
        [ ( "background-color", "red" )
        , ( "display", "block" )
        , ( "height", "28px" )
        , ( "padding-left", "4px" )
        ]


crossSvg =
    svg
        [ Svg.Attributes.width "28"
        , Svg.Attributes.height "28"
        , Svg.Attributes.viewBox "0 0 28 28"
        ]
        [ Svg.line
            [ Svg.Attributes.fill "none"
            , Svg.Attributes.stroke "white"
            , Svg.Attributes.strokeWidth "4"
            , Svg.Attributes.x1 "4"
            , Svg.Attributes.y1 "4"
            , Svg.Attributes.x2 "24"
            , Svg.Attributes.y2 "24"
            ]
            []
        , Svg.line
            [ Svg.Attributes.fill "none"
            , Svg.Attributes.stroke "white"
            , Svg.Attributes.strokeWidth "4"
            , Svg.Attributes.x1 "4"
            , Svg.Attributes.y1 "24"
            , Svg.Attributes.x2 "24"
            , Svg.Attributes.y2 "4"
            ]
            []
        ]


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
        []
        [ ul [ style [ ( "list-style-type", "none" ) ] ]
            [ li [] [ text "Fate Angle" ]
            , li [] [ text "Love Formula" ]
            , li [] [ text "Secrete Wall" ]
            , li [] [ text "Draw & Guess" ]
            , li [] [ text "Events" ]
            ]
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
