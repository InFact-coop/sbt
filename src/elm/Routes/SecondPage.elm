module Routes.SecondPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


secondPage : Model -> Html Msg
secondPage model =
    div [ class "center" ]
        [ section [] [ h1 [ class "tc f3" ] [ text "What brings you here?" ] ]
        , li []
            [ fieldset []
                [ label [ class "whatever" ] [ input [ class "o-0", type_ "checkbox" ] [ text "whatev" ] ]
                , label [] [ input [ type_ "checkbox" ] [ text "bla" ] ]
                ]
            ]
        ]



-- <img class="tc-ns w-50 h-50 margin-0-auto pb2 db mt3" src="https://iconmonstr.com/wp-content/g/gd/makefg.php?i=../assets/preview/2012/png/iconmonstr-smartphone-4.png&r=51&g=51&b=51" alt="sms">
