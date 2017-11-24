module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- My Elm Files

import Types exposing (..)
import Routes.Home exposing (..)
import Routes.SecondPage exposing (..)
import Routes.Sent exposing (..)
import Routes.ThirdPage exposing (..)
import Routes.FourthPage exposing (..)
import Routes.Navbar exposing (..)


view : Model -> Html Msg
view model =
    let
        page =
            case model.route of
                HomeRoute ->
                    home model

                SecondPageRoute ->
                    secondPage model

                ThirdPageRoute ->
                    thirdPage model

                FourthPageRoute ->
                    fourthPage model

                SentRoute ->
                    sent model
    in
        div [ class "" ]
            [ navbar model
            , page
            ]
