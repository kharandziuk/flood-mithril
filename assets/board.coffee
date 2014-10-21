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

  getNeighbors = (num)->
    result = [
      num - size,
      num + size
    ]
    result.push(num + 1) if (num + 1) % size isnt 0
    result.push(num - 1) if (num) % size isnt 0
    return result

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
