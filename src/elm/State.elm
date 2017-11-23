module State exposing (..)

import Types exposing (..)


-- MODEL


initModel : Model
initModel =
    { route = HomeRoute
    , userInput = ""
    , reasonForVisiting = [ ( "schoolTrip", False ), ( "book", False ), ( "computer", False ), ( "wifi", False ), ( "event", False ), ( "bookbug", False ) ]
    }



--UPDATE


getRoute : String -> Route
getRoute hash =
    case hash of
        "#home" ->
            HomeRoute

        "#secondPage" ->
            SecondPageRoute

        "#pagetwo" ->
            PageTwoRoute

        _ ->
            HomeRoute


findToggledIcon : ( String, Bool ) -> ( String, Bool )
findToggledIcon ( class, isToggled ) =
    if Tuple.first == class then
        ( class, not isToggled )
    else
        ( class, isToggled )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Change newInput ->
            ( { model | userInput = newInput }, Cmd.none )

        UrlChange location ->
            ( { model | route = (getRoute location.hash) }, Cmd.none )

        ToggleIcon ( class, toggled ) ->
            ( { model | reasonForVisiting = (List.map findToggledIcon model.reasonForVisiting) }, Cmd.none )
