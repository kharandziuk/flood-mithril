# __tests__/board-test.coffee
jest.dontMock('../board.coffee')

Board = require('../board.coffee')

describe 'Board', ->
  it 'can win', ->
    board = Board([
        0, 1, 1
        1, 1, 1
        1, 1, 1
    ])
    board.flood(1)
    expect(board.state).toEqual([
        1, 1, 1
        1, 1, 1
        1, 1, 1
    ])
    expect(board.isWin).toBeTruthy()
    
  it 'can change color in all directions', ->
    board = Board([
        1, 1, 1, 2
        2, 2, 1, 1
        2, 2, 1, 3
        1, 1, 1, 0
    ])
    board.flood(0)
    expect(board.state).toEqual([
        0, 0, 0, 2
        2, 2, 0, 0
        2, 2, 0, 3
        0, 0, 0, 0
    ])
    expect(board.isWin).toBeFalsy()
