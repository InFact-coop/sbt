port module State exposing (..)

import Types exposing (..)
import Time exposing (Time, second)


-- MODEL


initModel : Model
initModel =
    { route = HomeRoute
    , userInput = ""
    , reasonForVisiting = [ ( "school trip", False ), ( "borrow a book", False ), ( "use a computer", False ), ( "wifi", False ), ( "event", False ), ( "bookbug", False ) ]
    , messageType = [ ( Audio, Stage0 ), ( Video, Stage0 ), ( Text, Stage0 ) ]
    , audioMessage = ""
    , messageLength = 0
    , paused = True
    , starClass = 0
    , backgroundColor = False
    , autoCount = 0
    }



--UPDATE


getRoute : String -> Route
getRoute hash =
    case hash of
        "#home" ->
            HomeRoute

        "#secondPage" ->
            SecondPageRoute

        "#thirdPage" ->
            ThirdPageRoute

        "#fourthPage" ->
            FourthPageRoute

        "#sent" ->
            SentRoute

        "#reviewPage" ->
            ReviewPageRoute

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


findToggledMessage : Message -> ( Message, Stage ) -> ( Message, Stage )
findToggledMessage message ( mappedMessage, mappedStage ) =
    if mappedMessage == message then
        case mappedStage of
            Stage0 ->
                ( mappedMessage, Stage1 )

            Stage1 ->
                ( mappedMessage, Stage2 )

            Stage2 ->
                ( mappedMessage, Stage0 )
    else
        ( mappedMessage, mappedStage )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            if model.messageLength >= 30 then
                model
                    |> update
                        (ToggleAudio ( Audio, Stage1 ))
            else
                ( { model | messageLength = model.messageLength + 1 }, Cmd.none )

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

        ToggleAudio ( message, stage ) ->
            case stage of
                Stage2 ->
                    ( { model | messageLength = 0, route = SentRoute, messageType = (List.map (\n -> findToggledMessage message n) model.messageType) }, Cmd.none )

                Stage1 ->
                    ( { model | paused = True, messageType = (List.map (\n -> findToggledMessage message n) model.messageType) }, recordStop "yes" )

                Stage0 ->
                    ( { model | paused = False, messageType = (List.map (\n -> findToggledMessage message n) model.messageType) }, recordStart "yes" )

        ToggleText ( message, stage ) ->
            case stage of
                Stage2 ->
                    ( { model | messageType = (List.map (\n -> findToggledMessage message n) model.messageType) }, Cmd.none )

                Stage1 ->
                    ( { model | messageType = (List.map (\n -> findToggledMessage message n) model.messageType) }, Cmd.none )

                Stage0 ->
                    ( { model | messageType = (List.map (\n -> findToggledMessage message n) model.messageType) }, Cmd.none )

        ToggleVideo ( message, stage ) ->
            case stage of
                Stage2 ->
                    ( { model | messageType = (List.map (\n -> findToggledMessage message n) model.messageType) }, Cmd.none )

                Stage1 ->
                    ( { model | messageType = (List.map (\n -> findToggledMessage message n) model.messageType) }, Cmd.none )

                Stage0 ->
                    ( { model | messageType = (List.map (\n -> findToggledMessage message n) model.messageType) }, Cmd.none )

        YellowStarClass int ->
            ( { model | starClass = int, backgroundColor = True }, Cmd.none )

        Count ->
            if model.autoCount > 3 then
                ( { model | autoCount = 0, route = StoryBoardRoute }, Cmd.none )
            else
                ( { model | autoCount = model.autoCount + 1 }, Cmd.none )


port recordStart : String -> Cmd msg


port recordStop : String -> Cmd msg


port audioUrl : (String -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ audioUrl RecieveAudio
        , if not model.paused then
            Time.every second (always Increment)
          else
            Sub.none
        , if model.route == SentRoute then
            Time.every second (\t -> Count)
          else
            Sub.none
        ]
