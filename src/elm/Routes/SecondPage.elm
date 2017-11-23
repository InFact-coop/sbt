module Routes.SecondPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


secondPage : Model -> Html Msg
secondPage model =
    div [ class "center" ]
        [ section [] [ h1 [ class "tc f3" ] [ text "What brings you here?" ] ]
        , fieldset []
                  [ label [] [ input [ type_ "checkbox"] [ text "Email Notifications"]
                  , label [] [ input [ type_ "checkbox"] [ text "Video Autoplay"]
                  ]
                ]
