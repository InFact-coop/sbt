module Types exposing (..)

import Navigation
import Time exposing (Time, second)


-- Model


type Route
    = HomeRoute
    | SecondPageRoute
    | ThirdPageRoute
    | FourthPageRoute
    | SentRoute


type Message
    = Audio
    | Text
    | Video


type Stage
    = Stage0
    | Stage1
    | Stage2


type alias Model =
    { route : Route
    , userInput : String
    , reasonForVisiting : List ( String, Bool )
    , messageType : List ( Message, Stage )
    , audioMessage : String
    , messageLength : Int
    , paused : Bool
    }



-- Update


type Msg
    = UrlChange Navigation.Location
    | ToggleIcon ( String, Bool )
    | RecordStart String
    | RecordStop String
    | RecieveAudio String
    | ToggleAudio ( Message, Stage )
    | ToggleVideo ( Message, Stage )
    | ToggleText ( Message, Stage )
    | Increment
