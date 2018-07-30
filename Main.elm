import Html exposing (..)
import Html.Events exposing (..)

{-
   Our Message type, can be either an Adopt or a Sell message  
-}
type Msg
  = Adopt
  | Sell


{-
   Our Model type, a record containing a 'cats' field
-}
type alias Model =
  { cats : Int }


{-
   Simple function declaration
   The 'add' function takes two arguments 'a' and 'b', adds them and returns the result
-}
add : number -> number -> number
add a b =
  a + b


{-
   Pluralise takes an integer and two strings
   If the integer is one it returns the first string
   Otherwise it returns the second string
-}
pluralise : Int -> String -> String -> String
pluralise n single plural =
  if n == 1 then
    single
  else
    plural


{-
   Our 'cat' text, returns a message based on how many cats we have
   More than three cats is too many
   Anything less and we return the number of cats we have
-}
catText : Int -> String
catText cats =
  if cats > 3 then
    "You have too many cats :("
  else
    "You have " ++ toString cats ++ " " ++ pluralise cats "cat" "cats" ++ "."


{-
   A simple list of strings
-}
animals : List String
animals =
  [ "cat", "dog", "rabbit" ]


{-
   Our initial model, with zero cats
-}
model : Model
model = Model 0


{-
   Our update function
   Takes a message and the model and returns an updated model
   Adopt messages increment the number of cats
   Sell messages decrement the number of cats, but not below zero
-}
update : Msg -> Model -> Model
update msg model =
  case msg of
    Adopt ->
      { model | cats = model.cats + 1 }
    
    Sell ->
      if model.cats > 0 then
        { model | cats = model.cats - 1 }
      else
        model

{-
   Our view function
   Takes the model and returns some HTML displaying our 'cat' text and
   buttons to adopt and sell cats
-}
view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text "Hello DDD!" ]
    , p [] [ text (catText model.cats) ]
    , button [ onClick Adopt ] [ text "Adopt cat" ]
    , button [ onClick Sell ] [ text "Sell cat" ]
    ]


{-
   Our main function
   Automatically wires together our model, update and view
-}
main : Program Never Model Msg
main =
  beginnerProgram
    { model = model
    , update = update
    , view = view
    }

    