m = require('../node_modules/mithril/mithril')

size = 15
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

randomState = ()->
  sizeMatrix.map (el)->
    return Math.floor(Math.random() * colors.length)

# app
app = {}
app.Board = require('./board.coffee')

# controller
app.controller = ()->
  @restart = ()->
    @board = app.Board(randomState())
    @activeColor = colors[@board.state[0]]

  @choose = (color)=>
    return false if @activeColor is colors[color]
    @board.flood(color)
    @activeColor = colors[color]

  @restart()

  return @


# views
views =
  table: (ctrl)->
    m 'table.fade-onload',
      m 'tbody', sizeArr.map (i)->
        m 'tr', sizeArr.map (j)->
          colorId = ctrl.board.state[i * size + j]
          m 'td',
            class: colors[colorId],
            onclick: ctrl.choose.bind(ctrl, colorId)
  counter: (ctrl)->
    m 'p', ctrl.counter


app.view = (ctrl)->
  m 'div#main', class: ctrl.activeColor,
    views.table(ctrl),
    # views.counter(ctrl),

# module init
m.module(document.body, app)
