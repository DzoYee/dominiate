#!/usr/bin/env coffee
#
# This is the script that you can run at the command line to see how
# strategies play against each other.

{State,tableaux} = require './gameState'
{BasicAI} = require './basicAI'
fs = require 'fs'
coffee = require 'coffee-script'

loadStrategy = (filename) ->
  ai = new BasicAI()
  console.log(filename)

  changes = eval coffee.compile(
    fs.readFileSync(filename, 'utf-8'),
    {bare: yes}
  )
  for key, value of changes
    ai[key] = value
  ai

ai1 = loadStrategy('strategies/TDminion.coffee')
ai2 = loadStrategy('strategies/TDminion.coffee')
ai2.name = 'TDminion2'
#ai2.net = ai1.net

playGame = (filenames) ->
  ais = [ai1, ai2]
  st = new State().setUpWithOptions(ais, {
    colonies: false
    randomizeOrder: true
    log: console.warn
    require: []
  })
  until st.gameIsOver()
    st.doPlay()
  result = ([player.ai.toString(), player.getVP(st), player.turnsTaken] for player in st.players)
  console.log(result)
  result

for i in [0...1000]
  playGame()

exports.playGame = playGame