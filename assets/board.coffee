assert = require 'assert'

Board = (state)->
  ###
  # state describes initial board states 
  # each number coresponds to some color
  ###
  size = Math.sqrt(state.length)
  assert (size * size) is state.length, "#{size}, #{state.length}"
  # colors
  @state = state

  getNeighbors = (num)-> [num - 1, num + 1, num - size, num + size]

  floodCell = (num, newColor, oldColor, checked)=>
    @state[num] = newColor
    getNeighbors(num).forEach((nIndex)=>
      return unless @state[nIndex]?
      return if nIndex in checked
      checked.push(nIndex)
      if oldColor is @state[nIndex]
        floodCell(
          nIndex, newColor, oldColor, checked
        )
    )

  @flood = (color)=>
    prevColor = @state[0]
    floodCell(0, color, prevColor, [0])
    @isWin = @state.every((x)-> x)
  return @

module.exports = Board
