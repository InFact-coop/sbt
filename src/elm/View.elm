module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- My Elm Files

import Types exposing (..)
import Routes.Home exposing (..)
import Routes.SecondPage exposing (..)
import Routes.ReviewPage exposing (..)
import Routes.ThirdPage exposing (..)
import Routes.Sent exposing (..)
import Routes.FourthPage exposing (..)
import Routes.StoryBoard exposing (..)


view : Model -> Html Msg
view model =
    let
        page =
            case model.route of
                HomeRoute ->
                    home model

                SecondPageRoute ->
                    secondPage model

                ReviewPageRoute ->
                    reviewPage model

                ThirdPageRoute ->
                    thirdPage model

                SentRoute ->
                    sent model

                StoryBoardRoute ->
                    storyBoard model

                FourthPageRoute ->
                    fourthPage model
    in
        div [ class "" ]
            [ page
            ]
