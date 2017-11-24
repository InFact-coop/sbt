module Routes.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


home : Model -> Html Msg
home model =
    div [ class "homeContainer mw6 center main min-h-100" ]
        [ section
            []
            [ h1
                [ class "tc ma0 pt2 b" ]
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
                [ class "tc pt2 f3" ]
                [ span
                    [ class "db" ]
                    [ text "Choose your" ]
                , span
                    [ class "db" ]
                    [ text "avatar" ]
                , div
                    [ class "corner-right" ]
                    [ a [ href "#secondPage" ] [ div [ class "corner-right-triangle" ] [ p [ class "white f4 fr pt3 pr2" ] [ text "1" ] ] ] ]
                ]
            ]
        , a
            [ class "db br-100 w10 h10 center bg-bookbug", href "#secondPage" ]
            []
        , audio [] []
        ]
