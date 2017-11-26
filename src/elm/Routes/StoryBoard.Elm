module Routes.StoryBoard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


storyBoard : Model -> Html Msg
storyBoard model =
    div [ class "center main mw6 homeContainer mh-100" ]
        [ h1 [ class "tc ma0 pt2 b f3" ] [ text "Story Board" ]
        ,h4 [class " date pt4 f5"] [text "27 November 2017"]
        , audio
            [ src model.audioMessage
            , preload "auto"
            , controls True
            ]
            []
        ]
