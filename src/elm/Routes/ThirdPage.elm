module Routes.ThirdPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


thirdPage : Model -> Html Msg
thirdPage model =
    div [ class "center main" ]
        [ h1 [ class "tc f3 pa3 ma2" ]
            [ text "What's your story?" ]
        , makeIcons model
        ]


makeIcons : Model -> Html Msg
makeIcons model =
    section [ class "recordIcons" ]
        (List.map
            makeIcon
            model.messageType
        )


makeIcon : ( Message, Stage ) -> Html Msg
makeIcon ( message, stage ) =
    div [ class <| (messageToClass ( message, stage )) ++ " pointer ba bw2 br-pill pa4 pl5 tc mw5half center mv5", onClick (messageToMsg ( message, stage )) ] [ text <| messageToText ( message, stage ) ]


messageToMsg : ( Message, Stage ) -> Msg
messageToMsg ( message, int ) =
    case message of
        Audio ->
            ToggleAudio ( message, int )

        Text ->
            ToggleText ( message, int )

        Video ->
            ToggleVideo ( message, int )


messageToText : ( Message, Stage ) -> String
messageToText ( message, stage ) =
    case ( message, stage ) of
        ( Audio, Stage1 ) ->
            "0:00"

        ( Audio, Stage2 ) ->
            "SEND IT"

        ( Audio, Stage0 ) ->
            "TELL US"

        ( Video, Stage0 ) ->
            "SHOW US"

        ( Video, Stage1 ) ->
            "0:00"

        ( Text, Stage0 ) ->
            "WRITE US"

        ( Text, Stage1 ) ->
            "WRITE US"

        ( Text, Stage2 ) ->
            "SEND IT"

        _ ->
            ""


messageToClass : ( Message, Stage ) -> String
messageToClass ( message, stage ) =
    case ( message, stage ) of
        ( Audio, Stage0 ) ->
            "mic red b--red"

        ( Audio, Stage1 ) ->
            "mic-checked bg--red b--red white"

        ( Audio, Stage2 ) ->
            "send red b--red"

        ( Text, Stage0 ) ->
            "write brand b--brand"

        ( Text, Stage1 ) ->
            "write-checked bg-brand b--brand white"

        _ ->
            "dn"
