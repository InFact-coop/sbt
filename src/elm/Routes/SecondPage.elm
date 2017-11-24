module Routes.SecondPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)
import Dialog exposing (..)


-- import Utils exposing (..)


secondPage : Model -> Html Msg
secondPage model =
    div [ class "center main mw6 min-h-100 homeContainer" ]
        [ section [] [ h1 [ class "tc f3 pa5 ma2" ] [ text "What brings you here?" ] ]
        , createIcons model
        , div [ class "corner-right" ]
            [ div [ class "corner-right-triangle", onClick NextPage ] [ p [ class "white f4 fr pt3 pr2" ] [ text "3" ] ] ]
        , Dialog.view
            (if model.showModal then
                Just (modalConfig model)
             else
                Nothing
            )
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
    div [ class "flex flex-column iconContainer ma3 tc center" ]
        [ input [ type_ "checkbox", class "dn", name "icon", id "icon" ]
            []
        , label [ class <| isChecked ( iconClass, isToggled ) ++ " dib br-100 h5 w5 icon", for "icon", onClick (ToggleIcon ( iconClass, isToggled )) ] []
        , caption [ class "caption f4 tc pt2 ma2" ] [ text iconClass ]
        ]


classHelper : String -> String
classHelper string =
    String.join "-" <| String.words string


modalConfig : Model -> Dialog.Config Msg
modalConfig model =
    { closeMessage = Just ReviewModal
    , containerClass = Nothing
    , header = Just (h3 [] [ text "leave your review" ])
    , body = Just (text ("5 stars"))
    , footer =
        Just
            (button
                [ class "btn btn-success"
                , onClick ReviewModal
                ]
                [ text "OK" ]
            )
    }
