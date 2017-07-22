module Main exposing (main)

import Html exposing (text, Html, button, body, br)
import Html.Events exposing (onClick)


type alias Model =
    Int


type Msg
    = Increase
    | Decrease


initModel : Model
initModel =
    1


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        Increase ->
            ( model + 1, Cmd.none )

        Decrease ->
            ( model - 1, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    body []
        [ button [ onClick Decrease ] [ text "-" ]
        , br [] []
        , text (toString model)
        , br [] []
        , button [ onClick Increase ] [ text "+" ]
        ]


main =
    Html.program
        { init = initModel ! []
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
