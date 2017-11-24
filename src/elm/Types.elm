module Types exposing (..)

import Navigation


-- Model


type Route
    = HomeRoute
    | SecondPageRoute
    | PageTwoRoute
    | ThirdPageRoute
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
