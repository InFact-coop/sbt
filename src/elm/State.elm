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


findToggledIcon : ( String, Bool ) -> ( String, Bool ) -> ( String, Bool )
findToggledIcon ( mappedClass, isMappedToggled ) ( selectedClass, isSelectedToggled ) =
    if selectedClass == mappedClass then
        ( mappedClass, not isMappedToggled )
    else
        ( mappedClass, isMappedToggled )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Change newInput ->
            ( { model | userInput = newInput }, Cmd.none )

        UrlChange location ->
            ( { model | route = (getRoute location.hash) }, Cmd.none )

        ToggleIcon classTuple ->
            ( { model | reasonForVisiting = (List.map (\n -> findToggledIcon n classTuple) model.reasonForVisiting) }, Cmd.none )
