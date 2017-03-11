#uses Bureaucrat to gain Silvers - based on RemodelFeodum
{
  name: 'BureaucratFeodum'
  author: 'jezz'
  requires: ["Feodum", "Squire", "Bureaucrat"]
  gainPriority: (state, my) -> [
    "Province" 
    "Feodum" if state.gainsToEndGame() <= 5
    "Duchy" if state.gainsToEndGame() <= 5
    "Silver" if state.gainsToEndGame() <= 5 and my.countInDeck("Feodum") >= 3
    "Estate" if state.gainsToEndGame() <= 2
    "Gold"
    "Bureaucrat" if my.countInDeck("Bureaucrat") < 2
    "Feodum"
    "Silver"
    "Squire"
  ]  
}
