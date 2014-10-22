m = require('../node_modules/mithril/mithril')

size = 14
sizeArr = [0...size]
sizeMatrix = [0...size*size]

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
  sizeMatrix.map (el)->
    return Math.floor(Math.random() * colors.length)


app.Board = require('./board.coffee')

app.controller = ()->
  @board = app.Board(randomState())
  @choose= (color)=>
    @board.flood(color)
  return @

app.view = (ctrl)->
  m 'div#main.orange',
    m 'table.fade-onload',
      m 'tbody', sizeArr.map (i)->
        m 'tr', sizeArr.map (j)->
          colorId = ctrl.board.state[i * size + j]
          m 'td',
            class: colors[colorId],
            onclick: ctrl.choose.bind(ctrl, colorId)


m.module(document.body, app)
