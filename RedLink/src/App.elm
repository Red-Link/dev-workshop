module App exposing (..)

import App.Data
import App.Model exposing (Model)
import App.Msg exposing (Msg(ClickFeature, CloseMenu, ShowMenu))
import App.View exposing (viewHeader, viewMainContent, viewMenu)
import Feature
import Html exposing (Html, body, div, h1, li, node, span, text, ul)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Svg exposing (svg)
import Svg.Attributes
import App.Layout
import Style exposing (..)


initModel : Model
initModel =
    { isShowMenu = False
    , currentFeature = Feature.FateAngel
    }


init =
    initModel ! []


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ShowMenu ->
            { model | isShowMenu = True } ! []

        CloseMenu ->
            { model | isShowMenu = False } ! []

        ClickFeature feature ->
            { model
                | currentFeature = feature
                , isShowMenu = False
            }
                ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    node "app"
        [ style App.Layout.appLayout ]
        (if model.isShowMenu then
            [ viewHeader model
            , viewMenu model
            ]
         else
            [ viewHeader model
            , viewMainContent model
            ]
        )
