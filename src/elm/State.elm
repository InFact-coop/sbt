port module State exposing (..)

import Types exposing (..)


-- MODEL


initModel : Model
initModel =
    { route = HomeRoute
    , userInput = ""
    , reasonForVisiting = [ ( "school trip", False ), ( "borrow a book", False ), ( "use a computer", False ), ( "wifi", False ), ( "event", False ), ( "bookbug", False ) ]
    , audioMessage = ""
    , showModal = False
    , starClass = 0
    }



--UPDATE


getRoute : String -> Route
getRoute hash =
    case hash of
        "#home" ->
            HomeRoute

        "#secondPage" ->
            SecondPageRoute

        "#reviewPage" ->
            ReviewPageRoute

        "#thirdPage" ->
            ThirdPageRoute

        "#storyBoard" ->
            StoryBoardRoute

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

        RecordStart string ->
            ( model, recordStart string )

        RecordStop string ->
            ( model, recordStop string )

        RecieveAudio string ->
            ( { model | audioMessage = string }, Cmd.none )

        NextPage ->
            ( { model | showModal = True }, Cmd.none )

        ReviewModal ->
            ( { model | showModal = False }, Cmd.none )

        YellowStarClass int ->
            ( { model | starClass = int }, Cmd.none )


port recordStart : String -> Cmd msg


port recordStop : String -> Cmd msg


port audioUrl : (String -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    audioUrl RecieveAudio
