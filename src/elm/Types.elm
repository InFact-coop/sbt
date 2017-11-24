module Types exposing (..)

import Navigation


-- Model


type Route
    = HomeRoute
    | SecondPageRoute
    | ThirdPageRoute


type alias Model =
    { route : Route
    , userInput : String
    , reasonForVisiting : List ( String, Bool )
    , audioMessage : String
    , showModal : Bool
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
