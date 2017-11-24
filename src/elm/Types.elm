module Types exposing (..)

import Navigation


-- Model


type Route
    = HomeRoute
    | SecondPageRoute
    | ReviewPageRoute
    | ThirdPageRoute
    | StoryBoardRoute


type alias Model =
    { route : Route
    , userInput : String
    , reasonForVisiting : List ( String, Bool )
    , audioMessage : String
    , starClass : Int
    , backgroundColor : Bool
    }



-- Update


type Msg
    = Change String
    | UrlChange Navigation.Location
    | ToggleIcon ( String, Bool )
    | RecordStart String
    | RecordStop String
    | RecieveAudio String
    | YellowStarClass Int
