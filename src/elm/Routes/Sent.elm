module Routes.Sent exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


sent : Model -> Html Msg
sent model =
    div [ class "main--red center bg-red white tc pv5" ]
        [ div [ class "mw5half sent w10 h10 center pv5" ] []
        , h1 [ class "sans ma0 f1 pv5" ]
            [ text "Thanks!" ]
        ]
