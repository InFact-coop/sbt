module Routes.ThirdPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


thirdPage : Model -> Html Msg
thirdPage model =
    div [ class "center main" ]
        [ h1 [ class "tc f3 pa3 ma4" ]
            [ text "What's your story?" ]
        , makeIcons model
        ]


makeIcons : Model -> Html Msg
makeIcons model =
    section [ class "recordIcons" ]
        (List.map
            (\x -> makeIcon x model)
            model.messageType
        )


makeIcon : ( Message, Stage ) -> Model -> Html Msg
makeIcon ( message, stage ) model =
    div [ class <| (messageToClass ( message, stage )) ++ " pointer ba bw2 br-pill pa4 pl5 tc mw5half center mv5", onClick (messageToMsg ( message, stage )) ] [ text <| messageToText ( message, stage ) model ]


messageToMsg : ( Message, Stage ) -> Msg
messageToMsg ( message, int ) =
    case message of
        Audio ->
            ToggleAudio ( message, int )

        Text ->
            ToggleText ( message, int )

        Video ->
            ToggleVideo ( message, int )


lessThan10 : Int -> String
lessThan10 int =
    if int < 10 then
        "0"
    else
        ""


messageToText : ( Message, Stage ) -> Model -> String
messageToText ( message, stage ) model =
    case ( message, stage ) of
        ( Audio, Stage1 ) ->
            "00:" ++ (lessThan10 model.messageLength) ++ toString model.messageLength

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

        ( Text, Stage2 ) ->
            "write brand b--brand"

        _ ->
            "dn"
