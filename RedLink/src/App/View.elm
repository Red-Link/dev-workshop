module App.View exposing (..)

import App.Data
import App.Layout
import App.Model exposing (Model)
import App.Msg exposing (Msg(ClickFeature, CloseMenu, ShowMenu))
import Feature
import Feature.DrawAndGuess
import Feature.Events
import Feature.FateAngel
import Feature.LoveFormula
import Feature.SecreteWall
import Html exposing (Html, div, li, node, text, ul)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Svg exposing (svg)
import Svg.Attributes


viewHeader model =
    node "header"
        [ style App.Layout.headerLayout ]
        [ App.Layout.headerText App.Data.name
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
        [ style App.Layout.menuLayout ]
        [ ul
            [ style
                [ ( "list-style-type", "none" )
                , ( "margin", "0" )
                ]
            ]
            (let
                showItem isLast content feature =
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
                        , onClick (ClickFeature feature)
                        ]
                        [ text content ]
             in
                [ showItem False "Fate Angel" Feature.FateAngel
                , showItem False "Love Formula" Feature.LoveFormula
                , showItem False "Secrete Wall" Feature.SecreteWall
                , showItem False "Draw & Guess" Feature.DrawAndGuess
                , showItem True "Events" Feature.Events
                ]
            )
        ]


viewMainContent : Model -> Html Msg
viewMainContent model =
    node "mainContent"
        []
        [ model
            |> case model.currentFeature of
                Feature.FateAngel ->
                    Feature.FateAngel.view

                Feature.LoveFormula ->
                    Feature.LoveFormula.view

                Feature.SecreteWall ->
                    Feature.SecreteWall.view

                Feature.DrawAndGuess ->
                    Feature.DrawAndGuess.view

                Feature.Events ->
                    Feature.Events.view
        ]
