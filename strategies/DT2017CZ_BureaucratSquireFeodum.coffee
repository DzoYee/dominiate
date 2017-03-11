#uses Bureaucrat and Squire to gain Silvers - based on RemodelFeodum
{
  name: 'BureaucratSquireFeodum'
  author: 'jezz'
  requires: ["Feodum", "Squire", "Bureaucrat"]
  gainPriority: (state, my) -> [
    "Bureaucrat" if my.countInDeck("Bureaucrat") < 2
    "Squire" if my.countInDeck("Squire") < 3
    "Feodum"
    "Province"
    "Silver"
    "Squire"
  ]  
}
