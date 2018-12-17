TvShow.create(
  [
    { name: 'Vikingos',
      plot: 'Vikings es una serie que está basada en las leyendas sobre el vikingo Ragnar Lodbrok',
      seasons_attributes: [
        { season_number: 1,
          plot: 'Temporada 1',
          episodes_attributes: [
            {
              title: 'Ritos iniciáticos',
              episode_number: 1
            },
            {
              title: 'La ira de los nórdicos	',
              episode_number: 2
            },
            {
              title: 'Despojados',
              episode_number: 3
            },
            {
              title: 'Juicio',
              episode_number: 4
            },
            {
              title: 'La batida	',
              episode_number: 5
            },
            {
              title: 'El funeral	',
              episode_number: 6
            },
            {
              title: 'El rescate de un rey',
              episode_number: 7
            },
            {
              title: 'Sacrificio',
              episode_number: 8
            },
            {
              title: 'Todo cambia	',
              episode_number: 9
            },
            {
              title: 'Guerra de hermanos',
              episode_number: 10
            }
          ]
        },
        { season_number: 2,
          plot: 'Temporada 2',
          episodes_attributes: [
            {
              title: 'Invasión',
              episode_number: 1
            },
            {
              title: 'Traición',
              episode_number: 2
            },
            {
              title: 'Ojo por ojo',
              episode_number: 3
            },
            {
              title: 'Respuestas en sangre',
              episode_number: 4
            },
            {
              title: 'Sin perdón',
              episode_number: 5
            },
            {
              title: 'El águila de sangre',
              episode_number: 6
            },
            {
              title: 'Sin huesos',
              episode_number: 7
            },
            {
              title: 'La decisión',
              episode_number: 8
            },
            {
              title: 'La oración del Señor',
              episode_number: 9
            }
          ]
        }
      ]
    },
    {
      name: 'Juego de tronos',
      plot: 'Juego de tronos Está basada en la serie de novelas Canción de hielo y fuego.',
      seasons_attributes: [
        { season_number: 1,
          plot: 'Temporada 1',
          episodes_attributes: [
            {
              title: 'Se acerca el invierno',
              episode_number: 1
            },
            {
              title: 'El Camino Real',
              episode_number: 2
            },
            {
              title: 'Lord Nieve',
              episode_number: 3
            },
            {
              title: 'Tullidos, bastardos y cosas rotas',
              episode_number: 4
            },
            {
              title: 'El lobo y el león',
              episode_number: 5
            },
            {
              title: 'Una corona de oro',
              episode_number: 6
            },
            {
              title: 'Ganas o mueres',
              episode_number: 7
            },
            {
              title: 'Por el lado de la punta',
              episode_number: 8
            },
            {
              title: 'Baelor',
              episode_number: 9
            },
            {
              title: 'Fuego y sangre',
              episode_number: 10
            }
          ]
        },
        { season_number: 2,
          plot: 'Temporada 2',
          episodes_attributes: [
            {
              title: 'El Norte no olvida',
              episode_number: 1
            },
            {
              title: 'Las tierras de la noche',
              episode_number: 2
            },
            {
              title: 'Lo que está muerto no puede morir',
              episode_number: 3
            },
            {
              title: 'Jardín de huesos',
              episode_number: 4
            },
            {
              title: 'El fantasma de Harrenhal',
              episode_number: 5
            },
            {
              title: 'Los dioses antiguos y nuevos',
              episode_number: 6
            },
            {
              title: 'Un hombre sin honor',
              episode_number: 7
            },
            {
              title: 'Un príncipe de Invernalia',
              episode_number: 8
            },
            {
              title: 'Aguasnegras',
              episode_number: 9
            },
            {
              title: 'alar Morghulis',
              episode_number: 10
            }
          ]
        }
      ]
    },
    {
      name: 'The Walking Dead ',
      plot: 'La serie se sitúa en un mundo postapocalíptico y está protagonizada por Rick Grimes (Andrew Lincoln)',
      seasons_attributes: [
        { season_number: 1,
          plot: 'Temporada 1',
          episodes_attributes: [
            {
              title: 'Days Gone Bye',
              episode_number: 1
            },
            {
              title: 'Guts',
              episode_number: 2
            },
            {
              title: 'Tell It to the Frogs',
              episode_number: 3
            },
            {
              title: 'Vatos',
              episode_number: 4
            },
            {
              title: 'Wildfire',
              episode_number: 5
            },
            {
              title: 'TS-19',
              episode_number: 6
            }
          ]
        },
        { season_number: 2,
          plot: 'Temporada 2',
          episodes_attributes: [
            {
              title: 'What Lies Ahead',
              episode_number: 1
            },
            {
              title: 'Bloodletting',
              episode_number: 2
            },
            {
              title: 'Save the Last One',
              episode_number: 3
            },
            {
              title: 'Cherokee Rose',
              episode_number: 4
            },
            {
              title: 'Chupacabra',
              episode_number: 5
            },
            {
              title: 'Secrets',
              episode_number: 6
            },
            {
              title: 'Pretty Much Dead Already',
              episode_number: 7
            },
            {
              title: 'Nebraska',
              episode_number: 8
            },
            {
              title: 'Triggerfinger',
              episode_number: 9
            },
            {
              title: '18 Miles Out',
              episode_number: 10
            },
            {
              title: 'Judge, Jury, Executioner',
              episode_number: 11
            },
            {
              title: 'Better Angels',
              episode_number: 12
            },
            {
              title: 'Beside the Dying Fire',
              episode_number: 13
            }
          ]
        }
      ]
    }
  ]
)

Movie.create(
  [
    { name: 'Star Wars',
      plot: 'Es una serie de películas originalmente concebidas por el cineasta estadounidense George Lucas'
    },
    { name: 'Lord of the Rings',
      plot: 'Basada en la novela homónima del escritor británico J. R. R. Tolkien'
    }
  ]
)

User.create(
  [
    {
      full_name: 'Erick Mendoza',
      email: 'Erick@correo.com'
    },
    {
      full_name: 'Fabiola Borquez',
      email: 'fabi@correo.com'
    },
    {
      full_name: 'Eduardo Arenas',
      email: 'eduardo@correo.com'
    },
    {
      full_name: 'Katherine Cruz',
      email: 'kath@correo.com'
    }
  ]
)

PurchaseOption.create(
  [
    {
      price: 2.99,
      video_quality: 'HD'
    },
    {
      price: 2.50,
      video_quality: 'SD'
    }
  ]
)