{
  name: 'BMCouncilRoom'
  author: 'Svatal'
  requires: ['Council Room', "Squire"]
  gainPriority: (state, my) -> [
    "Province"
    "Duchy" if state.gainsToEndGame() <= 5
    "Estate" if state.gainsToEndGame() <= 2
    "Gold"
    "Council Room" if my.countInDeck("Council Room") < 1 or my.countInDeck("Council Room") < 2 and my.turnsTaken > 4
    "Silver"
    "Squire"
  ]
}
