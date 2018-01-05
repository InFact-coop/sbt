module Types exposing (..)

import Navigation


-- Model


type Route
    = HomeRoute
    | SecondPageRoute
    | ThirdPageRoute
    | FourthPageRoute
    | SentRoute
    | ReviewPageRoute
    | StoryBoardRoute


type Message
    = Audio
    | Text
    | Video


type Stage
    = Stage0
    | Stage1
    | Stage2
    | StageErr


type alias Model =
    { route : Route
    , userInput : String
    , reasonForVisiting : List ( String, Bool )
    , messageType : List ( Message, Stage )
    , audioMessage : String
    , messageLength : Int
    , paused : Bool
    , starClass : Int
    , backgroundColor : Bool
    , autoCount : Int
    }



-- Update


type Msg
    = UrlChange Navigation.Location
    | ToggleIcon ( String, Bool )
    | RecordStart String
    | RecordStop String
    | RecordError String
    | RecieveAudio String
    | ToggleAudio ( Message, Stage )
    | ToggleVideo ( Message, Stage )
    | ToggleText ( Message, Stage )
    | Increment
    | YellowStarClass Int
    | Count
    | NoOp
