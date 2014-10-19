m = require('../node_modules/mithril/mithril')

size = 14

colors = [
  'red'
  'orange'
  'yellow'
  'green'
  'blue'
  'violet'
]

app = {}

randomState = ()->
  [0..size*size].map((el)->
    return Math.floor(Math.random() * colors.length)
  )

app.Board = require('board.coffee')

app.controller = ()->
  @board = app.Board(randomState)
  func = (i, j)->
    @board.flood(i, j)
  @choose = func.bind(@)
  return @

app.view = (ctrl)-> [
  m 'div#main', {class: 'orange'}, [
    m 'table', [
      m 'tbody', [0...size].map((i)->
        m 'tr', [0...size].map((j)->
          color = colors[ctrl.board.state[i * size + j]]
          m "td.#{color}", { onclick: ()-> ctrl.choose(i, j)}
        )
      )
    ]
  ]
]

m.module(document.body, app)
