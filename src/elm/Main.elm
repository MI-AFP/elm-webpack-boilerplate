module Main exposing (main)

import Browser
import Html
import Html.Attributes as Attributes
import Html.Events as Events


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Flags =
    ()


type alias Model =
    Int


type Msg
    = Increment
    | Decrement


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( 0
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1
            , Cmd.none
            )

        Decrement ->
            ( model - 1
            , Cmd.none
            )


view : Model -> Browser.Document Msg
view model =
    let
        body =
            [ Html.div []
                [ Html.button [ Events.onClick Decrement ] [ Html.text "-" ]
                , Html.div [] [ Html.text (String.fromInt model) ]
                , Html.button [ Events.onClick Increment ] [ Html.text "+" ]
                ]
            , Html.img [ Attributes.src "/img/image.svg" ] []
            ]
    in
    { title = "Elm Webpack Boilerplate"
    , body = body
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
