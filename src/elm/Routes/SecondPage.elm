module Routes.SecondPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


secondPage : Model -> Html Msg
secondPage model =
    div [ class "center main flex flex-column homeContainer" ]
        [ section [] [ h1 [ class "tc f3 pa3 ma4" ] [ text "What brings you here?" ] ]
        , createIcons model
        , div [ class "corner-right" ]
            [ a [ href "#reviewPage" ] [ div [ class "corner-right-triangle" ] [ p [ class "white f4 fr pr1" ] [ text "2" ] ] ] ]
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
        (classHelper iconClass)
            ++ "-checked"
    else
        classHelper
            iconClass


createIcon : ( String, Bool ) -> Html Msg
createIcon ( iconClass, isToggled ) =
    div [ class "flex flex-column iconContainer ma3 tc center items-center" ]
        [ input [ type_ "checkbox", class "dn", name "icon", id "icon" ]
            []
        , label [ class <| isChecked ( iconClass, isToggled ) ++ " dib br-100 h4 w4 icon", for "icon", onClick (ToggleIcon ( iconClass, isToggled )) ] []
        , caption [ class "caption f4 tc pt2 ma2" ] [ text iconClass ]
        ]


classHelper : String -> String
classHelper string =
    String.join "-" <| String.words string
