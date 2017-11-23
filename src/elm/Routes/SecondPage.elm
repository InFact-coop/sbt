module Routes.SecondPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


secondPage : Model -> Html Msg
secondPage model =
    div [ class "center main" ]
        [ section [] [ h1 [ class "tc f3" ] [ text "What brings you here?" ] ]
        , createIcons model

        -- , label [ class "schoolTrip dib br-100 h5 w5", for "icon" ]
        --     [ input [ class "input o-0", name "icon", type_ "checkbox", value "school" ]
        --         []
        --     ]
        ]


createIcons : Model -> Html Msg
createIcons model =
    section []
        (List.map
            createIcon
            model.reasonForVisiting
        )


isChecked : ( String, Bool ) -> String
isChecked ( iconClass, isToggled ) =
    if isToggled == True then
        iconClass ++ "-checked"
    else
        iconClass


createIcon : ( String, Bool ) -> Html Msg
createIcon ( iconClass, isToggled ) =
    div [ class "dib iconContainer" ]
        [ input [ type_ "checkbox", class "dn", name "icon", id "icon" ]
            []
        , label [ class <| isChecked ( iconClass, isToggled ) ++ " dib br-100 h5 w5 icon", for "icon", onClick (ToggleIcon ( iconClass, isToggled )) ] []
        ]



-- <img class="tc-ns w-50 h-50 margin-0-auto pb2 db mt3" src="https://iconmonstr.com/wp-content/g/gd/makefg.php?i=../assets/preview/2012/png/iconmonstr-smartphone-4.png&r=51&g=51&b=51" alt="sms">
