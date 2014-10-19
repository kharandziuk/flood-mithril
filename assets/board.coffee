Board = (state)->
  ###
  # state describes initial board states 
  # each number coresponds to some color
  ###
  
  # colors
  @colorsArr = state

  getNeighbors = (num)->
    [num - 1, num + 1, num - size, num + size]

  floodCell = (num, newColor, oldColor, checked)->
    checked.push num
    @colorsArr[num] = newColor
    getNeighbors(num).each((nIndex)->
      if nIndex not in checked and prevColor is @colorsArr[nIndex]
        aux(nIndex, newColor, oldColor, checked)
    )

  @flood = (color)=>
    prevColor = @colorsArr[0]
    floodCell(num, color, prevColor, [])

  return @

module.exports = Board
