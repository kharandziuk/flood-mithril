assert = require 'assert'
Board = require('./board')

(->
    board = Board([
        0, 1, 1
        1, 1, 1
        1, 1, 1
    ])

    board.flood(0, 1)
    assert.deepEqual(
        [1, 2]
        [1, 2]
    )
    assert.equal(
        board.state
        [0...9].map(-> 0)
    )


                
