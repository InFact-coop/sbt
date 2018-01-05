module Routes.ReviewPage exposing (..)

import Html.Events exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


reviewPage : Model -> Html Msg
reviewPage model =
    div [ class <| "center main homeContainer" ]
        [ h1 [ class "tc f3 pa4" ] [ text "How would you rate your experience?" ]
        , Html.form [ class "star-rating center pl2 tc pt4" ]
            [ fieldset [ class "bn" ]
                [ span [ class "star-group" ]
                    (lightStar
                        model
                    )
                ]
            ]
        , div [ class "footer" ]
            [ div
                [ class "corner-right" ]
                [ a [ href "#thirdPage" ] [ div [ class "corner-right-triangle" ] [ p [ class "white f4 fr pr1" ] [ text "3" ] ] ] ]
            ]
        ]


lightStar : Model -> List (Html Msg)
lightStar model =
    let
        stars =
            [ 1, 2, 3, 4, 5 ]

        starIterator rating mappedStar =
            if rating >= mappedStar then
                div [ class "dib" ]
                    [ input [ id <| "rating-" ++ (toString mappedStar), name "rating", type_ "radio", value (toString mappedStar), class "dn", onClick ((YellowStarClass mappedStar)) ] []
                    , label [ for <| "rating-" ++ (toString mappedStar), class "star-checked" ] []
                    ]
            else
                div [ class "dib" ]
                    [ input [ id <| "rating-" ++ (toString mappedStar), name "rating", type_ "radio", value (toString mappedStar), class "dn", onClick (YellowStarClass mappedStar) ] []
                    , label [ for <| "rating-" ++ (toString mappedStar), class "star" ] []
                    ]
    in
        List.map (\n -> starIterator model.starClass n)
            stars


hasChanged : Model -> String
hasChanged model =
    if (model.backgroundColor == True) then
        " bg-blue"
    else
        ""
