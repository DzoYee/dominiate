{
  name: 'BMBureaucrat'
  author: 'Svatal'
  requires: ['Bureaucrat', "Squire"]
  gainPriority: (state, my) -> [
    "Province"
    "Duchy" if state.gainsToEndGame() <= 5
    "Estate" if state.gainsToEndGame() <= 2
    "Gold"
    "Bureaucrat" if my.countInDeck("Bureaucrat") < 2
    "Silver"
    "Squire"
  ]
}
