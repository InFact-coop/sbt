module Routes.ThirdPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


thirdPage : Model -> Html Msg
thirdPage model =
    div [ class "center main mw6 min-h-100" ]
        [ h1 [ class "tc f3 pa5 ma2" ]
            [ text "What's your story?" ]
        , div [ class "mic ba bw2 red b--red br-pill pa4 pl5 tc mw5half center mb5" ] [ text "TELL US" ]
        , div [ class "write ba bw2 brand b--brand br-pill pa4 pl5 tc mw5half center" ] [ text "WRITE US" ]
        , div [ id "audiocontainer" ]
            -- get rid of string
            [ button [ id "record", onClick (RecordStart "Stringy") ]
                [ text "Record" ]
            , button [ id "stop", onClick (RecordStop "Stringy") ]
                [ text "Stop" ]
            , div [ id "soundclips" ]
                [ audio [ controls True, id "audio", src model.audioMessage ]
                    []
                ]
            ]
        ]
