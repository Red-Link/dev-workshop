module Main exposing (main)

import Html exposing (text, Html, button, body, br, h1, input, div)
import Html.Attributes exposing (value, type_, checked)
import Html.Events exposing (onClick, onInput)


type alias Model =
    { items : List Item
    , newItem : String
    }


type alias Item =
    { text : String, done : Bool }


type Msg
    = NewItem
    | InputItem String
    | TickItem Item


initModel : Model
initModel =
    { items = []
    , newItem = ""
    }


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        InputItem userInput ->
            ( { model | newItem = userInput }, Cmd.none )

        NewItem ->
            if model.newItem == "" then
                ( model, Cmd.none )
            else
                ( { items =
                        { text = model.newItem, done = False }
                            :: model.items
                  , newItem = ""
                  }
                , Cmd.none
                )

        TickItem clickedItem ->
            ( { model | items = updateItems clickedItem model.items }, Cmd.none )


updateItems : Item -> List Item -> List Item
updateItems clickedItem items =
    List.map (updateItem clickedItem) items


updateItem : Item -> Item -> Item
updateItem clickedItem item =
    if clickedItem.text == item.text then
        { item | done = not item.done }
    else
        item


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    body []
        [ h1 [] [ text "To-Do List" ]
        , input [ onInput InputItem, value model.newItem ] []
        , button [ onClick NewItem ] [ text "+" ]
        , div [] (List.map viewItem model.items)
        ]


viewItem : Item -> Html Msg
viewItem item =
    div []
        [ br [] []
        , input
            [ type_ "checkbox"
            , checked item.done
            , onClick (TickItem item)
            ]
            []
        , text item.text
        ]


main =
    Html.program
        { init = initModel ! []
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
