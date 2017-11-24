module Routes.FourthPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


fourthPage : Model -> Html Msg
fourthPage model =
    div [ class "center main tc" ]
        [ h1 [ class "tc f3 pa3 ma2" ]
            [ text "Story Board" ]
        , div [ id "audiocontainer" ]
            [ div [ id "soundclips" ]
                [ audio [ controls True, id "audio", src model.audioMessage ]
                    []
                ]
            ]
        ]
