# README

Basic API, using Rspec, caching, serializer, and a simple GraphQL implementation.
includes the database structure database in a file 
[ERD.PDF](https://github.com/jvelez1/movies_api/blob/master/erd.pdf)

<p align="center">
  <img width="460" height="300" src="https://raw.githubusercontent.com/jvelez1/movies_api/master/erd.png">
</p>

**Basic to run the project**
```
rails db:create
rails db:migrate
rails db:seed
rails s
```

**GraphQL: [URL:PORT]/graphiql**
> query

```
query {
  movies {
    id
    name
    plot
  }
}
```
> response

```
{
  "data": {
    "movies": [
      {
        "id": "1",
        "name": "Rosemary Sutcliff",
        "plot": "One thing I know about linking books is that the doors they open don't close behind you."
      },
      {
        "id": "2",
        "name": "Taming a Sea Horse",
        "plot": "One thing I know about linking books is that the doors they open don't close behind you."
      },
      {
        "id": "3",
        "name": "Bury My Heart at Wounded Knee",
        "plot": "One thing I know about linking books is that the doors they open don't close behind you."
      }
    ]
  }
}
```

**API Routes**

> /v1/movies

**returns the list of movies ordered by date of creation**

> /v1/movies/:id

**returns movie by id**

> /v1/seasons

**returns the list of seasons ordered by date of creation, includes tv show, and episodes (order by number) by season**

> /v1/seasons/:id

**returns season by id, includes tv show, and episodes (order by number) by season**

> /v1/medias

**list seasons and movies grouped**

> /v1/user/:user_id/libraries

**list the user's library to consult, movies and seasons grouped, and active in the current date, ordered next to expire first.**

> /v1/user/:user_id/purchases

**An endpoint to create a purchase, and assign or re-activate (using expiry_date) a media to a user.**

**Some responses**

error_reponse
```
{
    "error": {
        "message": "Ups! Revisa los siguientes campos",
        "reasons": "Ya tienes esta opción es tu lista",
        "description": "La compra presenta valores incorrectos en sus atributos"
    }
}

```
user library
```

[
    {
        "library_isa_type": "Season",
        "library_isa_id": 2,
        "library_isa": {
            "id": 2,
            "tv_show_id": 1,
            "season_number": 2,
            "plot": "Temporada 2",
            "created_at": "2018-12-17T14:36:17.734Z",
            "updated_at": "2018-12-17T14:36:17.734Z"
        },
        "expiry_date": "2018-12-19T16:20:15.720Z",
        "expiry_date_message": "Esta temporada vence el 19/12/2018 a las 04:20PM",
        "created_at": "2018-12-17T16:20:15.735Z",
        "updated_at": "2018-12-17T16:20:15.735Z"
    },
    {
        "library_isa_type": "Movie",
        "library_isa_id": 1,
        "library_isa": {
            "id": 1,
            "name": "Star Wars",
            "plot": "Es una serie de películas originalmente concebidas por el cineasta estadounidense George Lucas",
            "created_at": "2018-12-17T14:36:17.855Z",
            "updated_at": "2018-12-17T14:36:17.855Z"
        },
        "expiry_date": "2018-12-19T16:18:02.469Z",
        "expiry_date_message": "Esta pelicula vence el 19/12/2018 a las 04:18PM",
        "created_at": "2018-12-17T16:18:02.481Z",
        "updated_at": "2018-12-17T16:18:02.481Z"
    }
]

```
success purchase
```

{
    "id": 1,
    "user_id": 1,
    "purchase_option_id": 1,
    "status": "success",
    "amount": 2.99,
    "media_type": "movie",
    "media_type_id": 1,
    "created_at": "2018-12-19T01:40:05.663Z",
    "updated_at": "2018-12-19T01:40:05.663Z"
}

```

 media
 ```

 {
    "movies": [
        {
          "id": 1,
          "name": "Rosemary Sutcliff",
          "plot": "Bring me blue pages.",
          "year": 2016,
          "directed_by": "Cassatt",
          "production_company": "Rocha y Valdivia",
          "country": "China",
          "created_at": "2019-01-20T12:16:19.963Z",
          "updated_at": "2019-01-20T12:16:19.963Z"
          },
          {
          "id": 2,
          "name": "Taming a Sea Horse",
          "plot": "One thing I know about linking books is that the doors they open don't close behind you.",
          "year": 1994,
          "directed_by": "Raphael",
          "production_company": "Bonilla, Valdivia y Ibarra Asociados",
          "country": "Guayana",
          "created_at": "2019-01-20T12:16:19.970Z",
          "updated_at": "2019-01-20T12:16:19.970Z"
          }
    ],
    "seasons": [
        {
            "id": 1,
            "season_number": 1,
            "plot": "Temporada 1",
            "tv_show": {
                "id": 1,
                "name": "Vikingos",
                "plot": "Vikings es una serie que está basada en las leyendas sobre el vikingo Ragnar Lodbrok",
                "created_at": "2018-12-19T01:01:04.658Z",
                "updated_at": "2018-12-19T01:01:04.658Z"
            },
            "episodes": [
                {
                    "title": "Ritos iniciáticos",
                    "episode_number": 1
                },
                {
                    "title": "La ira de los nórdicos\t",
                    "episode_number": 2
                },
                {
                    "title": "Despojados",
                    "episode_number": 3
                },
                {
                    "title": "Juicio",
                    "episode_number": 4
                },
                {
                    "title": "La batida\t",
                    "episode_number": 5
                },
                {
                    "title": "El funeral\t",
                    "episode_number": 6
                },
                {
                    "title": "El rescate de un rey",
                    "episode_number": 7
                },
                {
                    "title": "Sacrificio",
                    "episode_number": 8
                },
                {
                    "title": "Todo cambia\t",
                    "episode_number": 9
                },
                {
                    "title": "Guerra de hermanos",
                    "episode_number": 10
                }
            ]
        },
        {
            "id": 2,
            "season_number": 2,
            "plot": "Temporada 2",
            "tv_show": {
                "id": 1,
                "name": "Vikingos",
                "plot": "Vikings es una serie que está basada en las leyendas sobre el vikingo Ragnar Lodbrok",
                "created_at": "2018-12-19T01:01:04.658Z",
                "updated_at": "2018-12-19T01:01:04.658Z"
            },
            "episodes": [
                {
                    "title": "Invasión",
                    "episode_number": 1
                },
                {
                    "title": "Traición",
                    "episode_number": 2
                },
                {
                    "title": "Ojo por ojo",
                    "episode_number": 3
                },
                {
                    "title": "Respuestas en sangre",
                    "episode_number": 4
                },
                {
                    "title": "Sin perdón",
                    "episode_number": 5
                },
                {
                    "title": "El águila de sangre",
                    "episode_number": 6
                },
                {
                    "title": "Sin huesos",
                    "episode_number": 7
                },
                {
                    "title": "La decisión",
                    "episode_number": 8
                },
                {
                    "title": "La oración del Señor",
                    "episode_number": 9
                }
            ]
        },
        {
            "id": 3,
            "season_number": 1,
            "plot": "Temporada 1",
            "tv_show": {
                "id": 2,
                "name": "Juego de tronos",
                "plot": "Juego de tronos Está basada en la serie de novelas Canción de hielo y fuego.",
                "created_at": "2018-12-19T01:01:04.720Z",
                "updated_at": "2018-12-19T01:01:04.720Z"
            },
            "episodes": [
                {
                    "title": "Se acerca el invierno",
                    "episode_number": 1
                },
                {
                    "title": "El Camino Real",
                    "episode_number": 2
                },
                {
                    "title": "Lord Nieve",
                    "episode_number": 3
                },
                {
                    "title": "Tullidos, bastardos y cosas rotas",
                    "episode_number": 4
                },
                {
                    "title": "El lobo y el león",
                    "episode_number": 5
                },
                {
                    "title": "Una corona de oro",
                    "episode_number": 6
                },
                {
                    "title": "Ganas o mueres",
                    "episode_number": 7
                },
                {
                    "title": "Por el lado de la punta",
                    "episode_number": 8
                },
                {
                    "title": "Baelor",
                    "episode_number": 9
                },
                {
                    "title": "Fuego y sangre",
                    "episode_number": 10
                }
            ]
        },
        {
            "id": 4,
            "season_number": 2,
            "plot": "Temporada 2",
            "tv_show": {
                "id": 2,
                "name": "Juego de tronos",
                "plot": "Juego de tronos Está basada en la serie de novelas Canción de hielo y fuego.",
                "created_at": "2018-12-19T01:01:04.720Z",
                "updated_at": "2018-12-19T01:01:04.720Z"
            },
            "episodes": [
                {
                    "title": "El Norte no olvida",
                    "episode_number": 1
                },
                {
                    "title": "Las tierras de la noche",
                    "episode_number": 2
                },
                {
                    "title": "Lo que está muerto no puede morir",
                    "episode_number": 3
                },
                {
                    "title": "Jardín de huesos",
                    "episode_number": 4
                },
                {
                    "title": "El fantasma de Harrenhal",
                    "episode_number": 5
                },
                {
                    "title": "Los dioses antiguos y nuevos",
                    "episode_number": 6
                },
                {
                    "title": "Un hombre sin honor",
                    "episode_number": 7
                },
                {
                    "title": "Un príncipe de Invernalia",
                    "episode_number": 8
                },
                {
                    "title": "Aguasnegras",
                    "episode_number": 9
                },
                {
                    "title": "alar Morghulis",
                    "episode_number": 10
                }
            ]
        },
        {
            "id": 5,
            "season_number": 1,
            "plot": "Temporada 1",
            "tv_show": {
                "id": 3,
                "name": "The Walking Dead ",
                "plot": "La serie se sitúa en un mundo postapocalíptico y está protagonizada por Rick Grimes (Andrew Lincoln)",
                "created_at": "2018-12-19T01:01:04.753Z",
                "updated_at": "2018-12-19T01:01:04.753Z"
            },
            "episodes": [
                {
                    "title": "Days Gone Bye",
                    "episode_number": 1
                },
                {
                    "title": "Guts",
                    "episode_number": 2
                },
                {
                    "title": "Tell It to the Frogs",
                    "episode_number": 3
                },
                {
                    "title": "Vatos",
                    "episode_number": 4
                },
                {
                    "title": "Wildfire",
                    "episode_number": 5
                },
                {
                    "title": "TS-19",
                    "episode_number": 6
                }
            ]
        },
        {
            "id": 6,
            "season_number": 2,
            "plot": "Temporada 2",
            "tv_show": {
                "id": 3,
                "name": "The Walking Dead ",
                "plot": "La serie se sitúa en un mundo postapocalíptico y está protagonizada por Rick Grimes (Andrew Lincoln)",
                "created_at": "2018-12-19T01:01:04.753Z",
                "updated_at": "2018-12-19T01:01:04.753Z"
            },
            "episodes": [
                {
                    "title": "What Lies Ahead",
                    "episode_number": 1
                },
                {
                    "title": "Bloodletting",
                    "episode_number": 2
                },
                {
                    "title": "Save the Last One",
                    "episode_number": 3
                },
                {
                    "title": "Cherokee Rose",
                    "episode_number": 4
                },
                {
                    "title": "Chupacabra",
                    "episode_number": 5
                },
                {
                    "title": "Secrets",
                    "episode_number": 6
                },
                {
                    "title": "Pretty Much Dead Already",
                    "episode_number": 7
                },
                {
                    "title": "Nebraska",
                    "episode_number": 8
                },
                {
                    "title": "Triggerfinger",
                    "episode_number": 9
                },
                {
                    "title": "18 Miles Out",
                    "episode_number": 10
                },
                {
                    "title": "Judge, Jury, Executioner",
                    "episode_number": 11
                },
                {
                    "title": "Better Angels",
                    "episode_number": 12
                },
                {
                    "title": "Beside the Dying Fire",
                    "episode_number": 13
                }
            ]
        }
    ]
}

```



* ...
