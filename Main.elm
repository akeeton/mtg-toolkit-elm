import Html exposing (div, button, text)
import Html.Events exposing (onClick)
import StartApp.Simple as StartApp


main =
    StartApp.start { model = model, view = view, update = update }


partialAllCardsJson = """{"Air Elemental":{"layout":"normal","name":"Air Elemental","manaCost":"{3}{U}{U}","cmc":5,"colors":["Blue"],"type":"Creature — Elemental","types":["Creature"],"subtypes":["Elemental"],"text":"Flying","power":"4","toughness":"4","imageName":"air elemental","colorIdentity":["U"]},"Ancestral Recall":{"layout":"normal","name":"Ancestral Recall","manaCost":"{U}","cmc":1,"colors":["Blue"],"type":"Instant","types":["Instant"],"text":"Target player draws three cards.","imageName":"ancestral recall","colorIdentity":["U"]}}"""

type alias Model =
    { allCardsJson : String
    }

model : Model
model = { allCardsJson = partialAllCardsJson }


view address model =
    div []
        [ button [ onClick address Decrement  ] [ text "-"  ]
        , div [] [ text model.allCardsJson  ]
        , button [ onClick address Increment  ] [ text "+"  ]
        ]


type Action = Increment | Decrement


update action model =
    case action of
        Increment -> { model | allCardsJson = "Increment" }
        Decrement -> { model | allCardsJson = "Decrement" }

