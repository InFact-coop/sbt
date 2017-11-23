module Routes.SecondPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


secondPage : Model -> Html Msg
secondPage model =
    div [ class "center main" ]
        [ section [] [ h1 [ class "tc f3" ] [ text "What brings you here?" ], createIcon "schoolTrip" ]

        -- , label [ class "schoolTrip dib br-100 h5 w5", for "icon" ]
        --     [ input [ class "input o-0", name "icon", type_ "checkbox", value "school" ]
        --         []
        --     ]
        ]


createIcon : String -> Html Msg
createIcon imgClass =
    div []
        [ input [ class "input dn", name "icon", type_ "checkbox", value "school" ]
            []
        , label [ class <| "dib br-100 h5 w5 " ++ imgClass, for "icon" ]
            []
        ]



-- <img class="tc-ns w-50 h-50 margin-0-auto pb2 db mt3" src="https://iconmonstr.com/wp-content/g/gd/makefg.php?i=../assets/preview/2012/png/iconmonstr-smartphone-4.png&r=51&g=51&b=51" alt="sms">
