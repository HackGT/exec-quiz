import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List exposing (..)
import Dict
import Tuple
import Debug


--
-- DATA
--
questions : List Question
questions =
    [ { name = [text "A sponsor tries to appeal to you as a youth, what does he or she say?"]
      , image = "/static/img/super-excited.gif"
      , answers =
          [ simpleAnswer "Howdee doodee!"
          , simpleAnswer "I have some lovely memes, would you like to see them?"
          , simpleAnswer "I'll poke ya on Facebook ;O"
          , simpleAnswer "We have Apps and Machine Learning solutions."
          , simpleAnswer "Other places might be stuck in the stone age, but we have an open office floor plan."
          ]
      }
    , { name = [text "A member of HackGT accidentally sent a private message to a public channel. You figure out that its subreddit all about you called:"]
      , image = "/static/img/excited5.gif"
      , answers =
          [ simpleAnswer "/r/roasted"
          , simpleAnswer "/r/toasted"
          , simpleAnswer "/r/ghosted"
          , simpleAnswer "/r/coasted"
          , simpleAnswer "/r/posted"
          ]
      }
    , { name = [text "Where did you spend your fall semester?"]
      , image = "/static/img/super-duper-excited.gif"
      , answers =
          [ simpleAnswer "Seattle"
          , simpleAnswer "Georgia Tech"
          , simpleAnswer "Someplace sketchy with a Wacom Tablet."
          , simpleAnswer "In your apartment watching When Harry Met Sally, Love, Love Actually, The Big Sick, or The Perks of Being a Wallflower alone."
          , simpleAnswer "Living on a floor full of Freshmen. (gross?)"
          ]
      }
    , { name = [ text "You make a joke, maybe its something like \"Let's have a "
               , i [] [text "nice"]
               , text "-breaker\", but no one is laughing!"
               ]
      , image = "/static/img/jonah-hill.gif"
      , answers =
          [ simpleAnswer "Segue into an ice-breaker."
          , simpleAnswer "Be proud of your joke and reassure everyone: \"We have fun here\"."
          , simpleAnswer "Explain it."
          , simpleAnswer "Everyone must not have heard you, tell it again."
          -- TODO
          , simpleAnswer "HackGT meetings are no place for jokes."
          ]
      }
    , { name = [text "You get an angry text from someone you've ignored all day, who is it?"]
      , image = "/static/img/kate.gif"
      , answers =
          [ simpleAnswer "It's Lekha; You've been playing rocket league."
          , simpleAnswer "It's your partner; You've been playing D&D on Valentine's."
          , simpleAnswer "It's Andrew, he says your partner has been trying to reach you."
          , simpleAnswer "It's a false alarm, no one has messaged you this week."
          , simpleAnswer "It's your mom, you should probably call her..."
          ]
      }
    , { name = [text "You're on a date with someone you met in class, what do you say?"]
      , image = "/static/img/game-show.gif"
      , answers =
          [ htmlAnswer [i [] [text "\"Let me tell your all my favorite parts about HackGT...\""]]
          , htmlAnswer [i [] [text "\"So the other day at HackGT...\""]]
          , htmlAnswer [i [] [text "\"Where are you REALLY from?\""]]
          , htmlAnswer [i [] [text "\"Do you eat a lot of salad?\""]]
          , htmlAnswer [i [] [text "\"You're very well spoken.\""]]
          ]
      }
    , { name = [text "Andrew bursts into your room and wakes you up in the early morning, why did you decide to live with him?"]
      , image = "/static/img/hyper.gif"
      , answers =
          [ simpleAnswer "You wanted to live with Connor but accidentally messaged the exec group chat. Andrew replied first."
          , simpleAnswer "Andrew was your manic pixie dream girl. His stylish spiky hair and quirky attitude lured you in with the promise of adventure."
          , htmlAnswer [ text "It's too late, you "
                       , i [] [text "are"]
                       , text " Andrew."
                       ]
          , simpleAnswer "It was a normal night, we were two beers deep, one thing led to another and..."
          , { text = p []
              [ text "Andrew is really cool, you don't understand all the shit he gets." ]
            , classes = []
            , disabled = True
            }
          ]
      }
    , { name = [text "You've applied to a somewhat prestigious program. Your friends and family are fairly sure you'll be accepted and tell you to get a cake on decision day. You've brought home a cake which shouts \"Congratulations\" in sweet icing; when you read your decision aloud you slowly realize you're rejected. Deep disappointment starts settles on everyone's face, how do you console your audience and maintain your own composure?"]
      , image = "/static/img/bill.gif"
      , answers =
          [ simpleAnswer "Don't make eye contact with anyone, say thank you and quickly walk to your room."
          , simpleAnswer "Tell them you're joking, begin to plan a complex lie you must follow for the rest of your life."
          , simpleAnswer "Risk the last bit of dignity you have, ask for a hug."
          , simpleAnswer "Hand everyone a slice of cake, calories are their punishment for believing in you."
          , htmlAnswer [ text "Begin to tear up, "
                       , i [] [text "\"I didn't want it that much anyway.\""]
                       ]
          ]
      }
    , { name = [ text "One person says to the other "
               , i [] [text "\"Hello, how are you?\""]
               , text " the other responds "
               , i [] [text "\"Howdee doodee mah dudees?\""]
               , text " Which one are you?"
               ]
      , image = "/static/img/emoji.gif"
      , answers =
          [ simpleAnswer "The one on the top."
          , simpleAnswer "The one on the bottom."
          , simpleAnswer "The one on the left."
          , simpleAnswer "The one in the air."
          , htmlAnswer [text "The one ", i [] [text "in between."]]
          ]
      }
    , { name = [text "Last question, it all hinges on this. A small boy comes up to you and says \"Oh golly gee, I know you! You're"]
      , image = ""
      , answers =
          [ simpleAnswer "Michael Eden!\""
          , simpleAnswer "Andrew Dai!\""
          , simpleAnswer "Lekha Surasani!\""
          , simpleAnswer "Connor Dautel!\""
          , simpleAnswer "Jordan Madison!\""
          , simpleAnswer "Faizan Virani!\""
          ]
      }
    ]


results : List (String, Result)
results =
    [ ( "michael"
      , { title = "You got: Michael Eden!"
        , image = "/static/img/michael.jpg"
        , description =
            [ "Handsome, dashing, and pretty, Michaels are commonly thought of as the most good-looking of the exec board. The don't like to keep friends that they see as a threat close by, so if you're being ignored by a Michael, congratulations!"
            , "But being bewitching and beautiful comes at a price. For example, Michaels will often ignore seeing their partners for hours in favor of seeing themselves in the mirror. So those cohabitating with a Michael should consider covering his or her head with a paper bag (so it doesn't turn into a distraction)."
            , "Other than simply being alluring, Michaels are also incredibly dazzling. Immediately at birth Michaels realize this and fear losing their fair appearance like their parents have. Then, at a certain age, Michaels stop looking at or owning mirrors, overwhelmed and afraid of their mortality. During this final phase, Michaels will often ask \"How do I look?\" or \"Notice anything different about me?\". It is imperative they are answered \"As angelic as the day you were born!\" and \"No, you've been in a ravishing stasis since the day you were born.\""
            , "Michaels are well suited for jobs like Modeling, Acting, Newscasting, and Computer Programming."
            ]
        }
      )
    , ( "faizan"
      , { title = "You got: Faizan Virani!"
        , image = "/static/img/faizan.jpg"
        , description =
            [ "Inquisitive and energetic, the Faizan is the traveler of the exec board. Their philosophical, broad-minded approach to life motivates them to wander far and wide in the search for the meaning of life. Extroverted, optimistic, and enthusiastic, it can be almost impossible to keep the Faizan down. They love change. In fact, change is essential for this sign to feel their best."
            , "Faizans are playful and love to have fun with their lovers. Passionate, expressive, and willing to try just about anything, partners who are equally outgoing are best suited to the Faizan. There's a fine line between sex and love for this sign. Their love of change and variety can bring a lot of different faces to the bedroom. But when it comes to love, that's an entirely different thing. Once taken, the Faizan is loyal, true-blue, and devoted."
            , "Whether it's stimulating conversation or a hike through the mountains, you can expect this exec member to be surrounded by friends. Faizans are a ton of fun and downright wacky at times. They're generous and are not ones to hold a grudge. Anyone who can sit a spell and talk about the deeper things in life will suit a Faizan just fine. They make friends easily and remain steadfast through the years."
            , "Fun loving Faizans enjoy making money. Considered the luckiest of the exec members, they don't worry too much about where the next buck is coming from. Faizans are risk-takers and highly optimistic, trusting in the universe to provide what is needed. Money-management tasks will bore the Faizan to tears, so getting a bookkeeper or accountant is the best plan in order to stay on top of what's coming and going."
            ]
        }
      )
    , ( "connor"
      , { title = "You got: Connor Dautel!"
        , image = "/static/img/connor.jpg"
        , description =
            [ "Smart, sophisticated, and kind, Connors get the job done without complaining. Connors are amazing friends, always there to lend a hand—and also lend advice. Practical Connors are incredibly adept at big picture thinking, and planning out their life, their vacations, and what they’re going to do today isn’t a drag—it makes them feel in control and secure."
            , "Connors have a rich inner life, and can sometimes seem shy at first meeting. A Connor won’t spill secrets right away, and it’s important to earn a Connor's trust. But once you do, that Connor will be a friend for life. And if you think that you're dating a shy Connor, trust that those walls will fall down in the bedroom. One of the most passionate exec board members, Connors specialize at connecting to their physicality, and this exec member loves and celebrates physical connection with their partner."
            , "Connors expect perfection from themselves, and they may project those high standards on the other people in their life. A Connor hates when someone lets him or her down, even if it’s minor and unavoidable, like a last-minute cancellation. Connors never want to disappoint the people in their lives, so they may spread themselves too thin or put themselves last."
            , "Connors love and are inspired by beauty. They consider what they wear and how they decorate their house to be an extension of their personality. They thrive when everything in their life looks Pinterest-perfect, and although their friends make fun of their penchant for organizing, it truly is the anchor that makes Connors' lives run smoothly."
            , "Intelligent and a lifelong learner, a Connor loves trying new things, reading books, and learning about the world. They'll happily sign up for an adult-education course, and they consider an afternoon in bed with a book pretty much ideal. A Connor prefers an evening with good friends to a huge party, and values downtime just as much as socializing. This exec member doesn't need to fill their calendar to be content."
            ]
        }
      )
    , ( "andrew"
      , { title = "You got: Andrew Dai!"
        , image = "/static/img/andrew.jpg"
        , description =
              [ "When it comes to professionalism and traditional values, Andrews win hands-down. These Andrews love to tackle life in the most conventional of ways, leaving no stone unturned. Considered the most serious-minded of the exec board, Andrews possess an independence that allows for considerable progress both personally and on the job."
              , "They cherish loved ones and will go any distance to help a friend or family member out. Traditional by nature, Andrews love nothing more than holidays, such as Thanksgiving, that bring people together with a variety of activities. Although Andrews aren't apt to have a large social circle, those included in their life will find someone who is steadfast and true. Emotional displays are not common for an Andrew. They would rather show how they feel through deed than express by word."
              , "The Andrew is most often a serious lover preferring to take things slow and steady. You won't see this exec board member jumping into anything headfirst. Taking relationships one step at a time is the way of the Andrew."
              , "In addition to setting high standards for themselves, honesty, perseverance, and a dedication to duty make Andrews excellent managers. Loyalty and a willingness to work as hard as necessary are qualities that this exec board member values greatly. Careers in management, finance, teaching, and real estate are excellent choices."
              ]
        }
      )
    , ( "jordan"
      , { title = "You got: Jordan Madison!"
        , image = "/static/img/jordan.jpg"
        , description =
              [ "Bold, intelligent, warm, and courageous, Jordans are natural leaders of HackGT Exec, ready to blaze a trail, vanquish injustice, and make a name for themselves along the way. Blessed with high self-esteem, Jordans know that they possess enviable traits—and they’re proud of them. They don’t believe in false modesty and will be the first to praise themselves for a job well done. But Jordans aren't self-aggrandizing or unwilling to roll up those sleeves and do the work: they know that in order to be respected and admired, they need to put in the effort worthy of a leader."
              , "But it’s not all hard work for Jordans. Intense and energetic, Jordans thrive on social interactions and have no problem making friends—although pinning them down to spend time with you is another story. Jordans put themselves first, and will turn down a plan that doesn’t fit with their agenda or idea of fun. This trait has gained them an unfair reputation for arrogance. But on the flip side, when a Jordan chooses to spend time with you, it’s genuinely because he or she wants to."
              , "Jordans are passionate in all pursuits, including relationships, and take it upon themselves to be the best partner you’ve ever had. They love grand gestures, and they want to show the world how attentive and caring they can be. They also can’t resist flashiness and often buy their partner the biggest and best presents. Jordan is an adventurer, seeking to balance an intense life of social obligations and travel with plenty of downtime to relax and luxuriate. Work and outward appearances matter to this sign, and they’re willing to do whatever it takes to gain a job title or workplace status, even if it means temporarily sacrificing their precious leisure time."
              , "Benevolent with their time and attention, Jordans are never cliquey, always showing friendliness and politeness to everyone. While almost everyone else is entranced by the Jordinian personality, Jordans are their own harshest critic and consider each day a challenge to be the best, brightest, and boldest Jordan they can be."
              ]
        }
      )
    , ( "lekha"
      , { title = "You got: Lekha Surasani!"
        , image = "/static/img/lekha.png"
        , description =
              [ "Lekhas are the trailblazers. Passionate and independent, Lekhas will never do something just because everyone else is doing it—a Lekha needs to be 100 percent committed to the task at hand. Competitive to the max, the best way to motivate a Lekha is to turn something into a contest. Lekhas will put everything they have (and then some) into winning. Loyal, smart, and impulsive, they always have multiple projects on their mind, and won't be satisfied until their work, social life, and personal lives line up exactly with the dream life they’ve envisioned. Those who are drawn to magnetic Lekhas may have trouble keeping up—but if they can, they'll have a friend for life."
              , "A Lekha will always tell you what they’re thinking, with a frankness that may occasionally border on rudeness. But even if a Lekha seems overly blunt with their opinion, that’s only because Lekhas value honesty above all else. And it works both ways. While a Lekha may be the first to say if they think that you just phoned in a project, they’ll also be the first to compliment you for a job well done. Lekhas may also have a short fuse. That fiery temper can be an asset. When a Lekha is angry, they'll never play the passive-aggressive card. But for people who don't know them well, their temper can be a turn off. Learning how to work out their anger—whether by going to the gym every day, taking some deep breaths, or learning to chill before they Tweet their thoughts to the world—is a lifelong process for Lekhas."
              , "When it comes to love, Lekhas are all about initial attraction. They can sense chemistry in the first sentence uttered by a potential partner. Forthright and unabashed, a Lekha will do everything in their power to go after someone they want. Sometimes, they need to learn how to slow down and foster long-term connections. Fireworks are fun, but they don’t necessarily make a great match. Lekhas are amazing lovers: versatile, passionate, and always invested in the moment."
              ]
        }
      )
    ]


invalidResult : Result
invalidResult =
    { title = "Oh no! A question slipped by you!"
    , description = ["You better go catch it!"]
    , image = ""
    }


weights : List (List (String, Int))
weights =
    -- 1
    [ [ ("michael", 1)
      , ("connor", 1)
      , ("jordan", 1)
      , ("faizan", 1)
      , ("andrew", 1)
      ]
    -- 2
    , [ ("andrew", 1)
      , ("connor", 1)
      , ("faizan", 1)
      , ("michael", 1)
      , ("jordan", 1)
      ]
    -- 3
    , [ ("faizan", 1)
      , ("lekha", 1)
      , ("connor", 1)
      , ("andrew", 1)
      , ("jordan", 1)
      ]
    -- 4
    , [ ("lekha", 1)
      , ("andrew", 1)
      , ("michael", 1)
      , ("connor", 1)
      , ("lekha", 1)
      ]
    -- 5
    , [ ("jordan", 1)
      , ("connor", 1)
      , ("michael", 1)
      , ("andrew", 1)
      , ("lekha", 1)
      ]
    -- 6
    , [ ("lekha", 1)
      , ("jordan", 1)
      , ("andrew", 1)
      , ("michael", 1)
      , ("faizan", 1)
      ]
    -- 7
    , [ ("michael", 1)
      , ("faizan", 1)
      , ("andrew", 1)
      , ("connor", 1)
      ]
    -- 8
    , [ ("andrew", 1)
      , ("michael", 1)
      , ("lekha", 1)
      , ("jordan", 1)
      , ("connor", 1)
      ]
    -- 9
    , [ ("lekha", 1)
      , ("jordan", 1)
      , ("andrew", 1)
      , ("faizan", 1)
      , ("connor", 1)
      ]
    -- 10
    , [ ("michael", 1)
      , ("andrew", 1)
      , ("lekha", 1)
      , ("connor", 1)
      , ("jordan", 1)
      , ("faizan", 1)
      ]
    ]

--
-- MODEL
--
type alias Answer =
    { text: Html Msg
    , classes: List (String, Bool)
    , disabled: Bool
    }

type alias Question =
    { name: List (Html Msg)
    , answers: List Answer
    , image: String
    }

type alias Result =
    { title: String
    , description: List String
    , image: String
    }

type alias Model =
    { questions: List Question
    , answers: Dict.Dict Int Int
    , resultsHidden: Bool
    }


htmlAnswer : List (Html Msg) -> Answer
htmlAnswer answer = { text = p [] answer, classes = [], disabled = False }

simpleAnswer : String -> Answer
simpleAnswer answer = [text answer] |> htmlAnswer

init : (Model, Cmd Msg)
init =
    (
     { questions = questions
     , answers = Dict.empty
     , resultsHidden = True
     }
    , Cmd.none
    )

calculateResult : Dict.Dict Int Int -> Result
calculateResult answers =
    let
        answerValue qi ai =
            drop qi weights |> head |> Maybe.andThen (head << drop ai)

        addToDict dict (k, v) =
            Dict.insert k (Dict.get k dict |> Maybe.withDefault 0 |> (+) v) dict

        foldAnswers qi ai m =
            answerValue qi ai |> Maybe.map (addToDict m) |> Maybe.withDefault m

        peopleScores = Dict.foldr foldAnswers Dict.empty answers
                       |> Debug.log "current scores"
        maxScore = Dict.foldr
                   (\k v (kc, vc) -> if v > vc then (k, v) else (kc, vc))
                   ("lowerbound", -1000)
                   peopleScores
    in
        if Dict.size answers < List.length questions
        then invalidResult
        else Dict.fromList results
            |> Dict.get (Tuple.first maxScore)
            |> Maybe.withDefault invalidResult


--
-- UPDATE
--
type Msg = MarkAnswer Int Int
         | GetResults

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        MarkAnswer qi ai ->
            ({ model |
               answers = Dict.insert qi ai model.answers
             , resultsHidden = True
             }, Cmd.none)

        GetResults ->
            ({ model | resultsHidden = False }, Cmd.none)


--
-- VIEW
--
view : Model -> Html Msg
view model = div []
             [ div [] (List.indexedMap (questionToHtml model) model.questions)
             , div [ classList [ ("resultbtn", True)
                               , ("hidden", not model.resultsHidden)
                               ]
                   ]
                   [ a [class "button is-danger", onClick GetResults]
                     [text "Get Results"]
                   ]
             , resultToHtml model
             , br [] []
             ]


resultToHtml : Model -> Html Msg
resultToHtml model =
    let result = calculateResult model.answers in
    let htmlLines l = p [] [text l, br [] [], br [] []] in
    div
    [ classList [ ("quizresult", True)
                , ("hidden", model.resultsHidden)
                ]
    ]
    [ h2 [class "result-title"] [text result.title]
    , p [] ( [img [src result.image] []]
             ++ (List.map htmlLines result.description)
           )
    ]


questionToHtml : Model -> Int -> Question -> Html Msg
questionToHtml model qi question =
    let answerToHtml ai answer =
        let selected = Dict.get qi model.answers == Just ai in
        button [ classList (
                 [ ("button", True)
                 , ("answer", True)
                 , ("is-primary", selected)
                 , ("is-focused", selected)
                 ] ++ answer.classes)
               , onClick (MarkAnswer qi ai)
               , onSubmit (MarkAnswer qi ai)
               , disabled answer.disabled
               , style (if selected then [("font-weight", "bold")] else [])
               ]
               [answer.text]
    in
    div []
    [ h2 [class "question"] ([text (toString (qi + 1) ++ ". ")] ++ question.name)
    , div [class "answers"] (List.indexedMap answerToHtml question.answers)
    , br [] []
    , div [class "image"]
          [img [src question.image] []]
    ]

main : Program Never Model Msg
main = Html.program
       { init = init
       , view = view
       , update = update
       , subscriptions = (always Sub.none)
       }
