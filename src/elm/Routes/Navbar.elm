module Routes.Navbar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


navbar : Model -> Html Msg
navbar model =
    ul [ class "ma0 bg-white w-100 pa2 dn" ]
        []


navbarLink : ( String, String ) -> Html Msg
navbarLink ( linkStr, name ) =
    li [ class "list dib ma3" ] [ a [ class "link dim white b", href ("/#" ++ linkStr) ] [ text name ] ]


navbarContent : List (Html Msg)
navbarContent =
    List.map navbarLink [ ( "home", "Home" ), ( "secondPage", "What brings you here?" ), ( "pagetwo", "Page Two" ) ]
