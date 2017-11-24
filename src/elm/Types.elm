module Types exposing (..)

import Navigation


-- Model


type Route
    = HomeRoute
    | SecondPageRoute
    | ReviewPageRoute
    | ThirdPageRoute


type alias Model =
    { route : Route
    , userInput : String
    , reasonForVisiting : List ( String, Bool )
    , audioMessage : String
    , showModal : Bool
    , starClass : Int
    }



-- Update


type Msg
    = Change String
    | UrlChange Navigation.Location
    | ToggleIcon ( String, Bool )
    | RecordStart String
    | RecordStop String
    | RecieveAudio String
    | NextPage
    | ReviewModal
    | YellowStarClass Int
