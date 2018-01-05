module Routes.Sent exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


sent : Model -> Html Msg
sent model =
    div [ class "center main--red white tc pv5" ]
        [ a [ href "#storyBoard", class "link" ]
            [ div [ class "mw5half sent w10 h10 center pv5" ] []
            , h1 [ class "white sans ma0 f1 pv5 link" ]
                [ text "Thanks!" ]
            ]
        , div [ class "footer" ]
            [ div
                [ class "corner-right" ]
                [ a [ href "#storyboard" ] [ div [ class "corner-right-triangle" ] [ p [ class "white f4 fr pr1" ] [ text "..." ] ] ] ]
            ]
        ]
