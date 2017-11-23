module Routes.SecondPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


secondPage : Model -> Html Msg
secondPage model =
    div [ class "center main mw6 min-h-100" ]
        [ section [] [ h1 [ class "tc f3 pa5 ma2" ] [ text "What brings you here?" ] ]
        , createIcons model
        ]


createIcons : Model -> Html Msg
createIcons model =
    section [ class "iconGrid" ]
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
    div [ class "flex flex-column iconContainer ma3 tc center" ]
        [ input [ type_ "checkbox", class "dn", name "icon", id "icon" ]
            []
        , label [ class <| isChecked ( iconClass, isToggled ) ++ " dib br-100 h5 w5 icon", for "icon", onClick (ToggleIcon ( iconClass, isToggled )) ] []
        , caption [ class "caption f4 tc pt2 ma2" ] [ text "school trip" ]
        ]



-- <img class="tc-ns w-50 h-50 margin-0-auto pb2 db mt3" src="https://iconmonstr.com/wp-content/g/gd/makefg.php?i=../assets/preview/2012/png/iconmonstr-smartphone-4.png&r=51&g=51&b=51" alt="sms">
