module Routes.ReviewPage exposing (..)

import Html.Events exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


--


reviewPage : Model -> Html Msg
reviewPage model =
    div [ class "center main mw6 min-h-100 homeContainer mh-100" ]
        [ h1 [ class "tc f3" ] [ text "How would you rate your experience?" ]
        , Html.form [ class "star-rating center pl2" ]
            [ fieldset [ class "bn" ]
                [ span [ class "star-group" ]
                    [ input [ id "rating-1", name "rating", type_ "radio", value "1" ]
                        []
                    , label [ for "rating-1", class "ratedStar" ] []
                    , input [ attribute "checked" "checked", id "rating-2", name "rating", type_ "radio", value "2", class "ratedInput dn" ]
                        []
                    , label [ for "rating-2", class "ratedStar" ] []
                    , input [ id "rating-3", name "rating", type_ "radio", value "3", class "ratedInput dn" ]
                        []
                    , label [ for "rating-3", class "ratedStar" ] []
                    , input [ id "rating-4", name "rating", type_ "radio", value "4", class "ratedInput dn" ]
                        []
                    , label [ for "rating-4", class "ratedStar" ] []
                    , input [ id "rating-5", name "rating", type_ "radio", value "5", class "ratedInput dn" ] []
                    , label [ for "rating-5", class "ratedStar" ] []
                    ]
                ]
            ]
        ]



-- toggleStarColour : Model -> String
-- toggleStarColour model =
--     if model.starClass <=
--
--
-- createStar : Model -> Html Msg
-- createStar model =
--     let
--         stars =
--             [ 1, 2, 3, 4, 5 ]
--
--         starIterator int List =
--           if int <=
--     in
--         List.map model.starClass
