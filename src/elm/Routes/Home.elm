module Routes.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


home : Model -> Html Msg
home model =
    div [ class "w-40-ns center main vh-100" ]
        [ section
            []
            [ h1
                [ class "tc ma0 pt5 b" ]
                [ span
                    [ class "db" ]
                    [ text "Hi, " ]
                , span
                    [ class "db" ]
                    [ text "Ruth!" ]
                ]
            ]
        , section
            []
            [ h2
                [ class "tc pt4 f3" ]
                [ span
                    [ class "db" ]
                    [ text "Choose your" ]
                , span
                    [ class "db" ]
                    [ text "avatar" ]
                ]
            ]
        , a
            [ class "db br-100 w10 h10 center bg-bookbug", href "#pagetwo" ]
            []
        ]
