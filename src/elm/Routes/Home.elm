module Routes.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


home : Model -> Html Msg
home model =
    div [ class "center main homeContainer" ]
        [ section
            []
            [ h1
                [ class "tc ma0 pt3 b" ]
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
                [ class "tc ma0 mt2 pt2" ]
                [ span
                    [ class "db f3" ]
                    [ text "Welcome to" ]
                , span
                    [ class "db f4" ]
                    [ text "Edinburgh Central Library" ]
                , div
                    [ class "corner-right" ]
                    [ a [ href "#secondPage" ] [ div [ class "corner-right-triangle" ] [ p [ class "white f4 fr pt3 pr2" ] [ text "1" ] ] ] ]
                ]
            ]
        , a
            [ class "mt4 db br-100 w9 h9 center bg-bookbug", href "#secondPage" ]
            []
        ]
