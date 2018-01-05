module Routes.StoryBoard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


storyBoard : Model -> Html Msg
storyBoard model =
    div [ class "center main homeContainer" ]
        [ h1 [ class "tc ma0 pt2 b f3 pa2" ] [ text "Story Board" ]
        , section [ class "bubbles dib pt2" ]
            [ section [ class "blueBubble" ] []
            , section [ class "redBubble" ] []
            , section [ class "borrowbooks" ] []
            ]
        , h2 [ class "f4 tc" ] [ text "Audio stories" ]
        , audio
            [ src model.audioMessage
            , preload "auto"
            , controls True
            , class "audio"
            ]
            []
            , div [ class "footer" ]
                [ div
                    [ class "corner-right" ]
                    [ a [ href "#home" ] [ div [ class "corner-right-triangle" ] [ p [ class "white f4 fr pr1" ] [ text "5" ] ] ] ]
                ]
        ]
