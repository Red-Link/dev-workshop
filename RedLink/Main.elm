module Main exposing (..)

import Html exposing (Html, body, h1, node, text)
import Html.Attributes exposing (size, style)


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
    body [ bodyStyle ]
        [ h1 [] [ text "Red-Link" ]
        , viewHeader model
        ]


bodyStyle =
    style
        [ ( "margin", "8px" )
        ]


viewHeader model =
    node "header" [] [ text "I am header" ]


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
