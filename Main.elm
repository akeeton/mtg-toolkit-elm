import Effects
import Html exposing (div, button, text)
import Html.Events exposing (onClick)
import StartApp
import Task


app =
    StartApp.start { init = init, view = view, update = update, inputs = [] }


main =
    app.html


port tasks : Signal (Task.Task Effects.Never ())
port tasks =
    app.tasks


type alias Model =
    { allCardsJson : String
    }


type Action = Increment | Decrement


model : Model
model = { allCardsJson = partialAllCardsJson }


init : (Model, Effects.Effects Action)
init = (model, Effects.none)


-- port allCardsJsonPort : Signal String

partialAllCardsJson = """{"Air Elemental":{"layout":"normal","name":"Air Elemental","manaCost":"{3}{U}{U}","cmc":5,"colors":["Blue"],"type":"Creature — Elemental","types":["Creature"],"subtypes":["Elemental"],"text":"Flying","power":"4","toughness":"4","imageName":"air elemental","colorIdentity":["U"]},"Ancestral Recall":{"layout":"normal","name":"Ancestral Recall","manaCost":"{U}","cmc":1,"colors":["Blue"],"type":"Instant","types":["Instant"],"text":"Target player draws three cards.","imageName":"ancestral recall","colorIdentity":["U"]}}"""


view address model =
    div []
        [ button [ onClick address Decrement  ] [ text "-"  ]
        , div [] [ text model.allCardsJson  ]
        , button [ onClick address Increment  ] [ text "+"  ]
        ]


update : Action -> Model -> (Model, Effects.Effects Action)
update action model =
    case action of
        Increment -> ({ model | allCardsJson = "Increment" }, Effects.none)
        Decrement -> ({ model | allCardsJson = "Decrement" }, Effects.none)

