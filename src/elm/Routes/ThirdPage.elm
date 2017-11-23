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
        ]
