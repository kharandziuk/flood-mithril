# __tests__/board-test.coffee
jest.dontMock('../board.coffee')

Board = require('../board.coffee')

describe 'Board', ->
  it 'can flood whole field', ->
    board = Board([
        [0, 1, 1]
        [1, 1, 1]
        [1, 1, 1]
    ])
    board.flood(1)
    expect(board.state).equalTo([
        [1, 1, 1]
        [1, 1, 1]
        [1, 1, 1]
    ])
