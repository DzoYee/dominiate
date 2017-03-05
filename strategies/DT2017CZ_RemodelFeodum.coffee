#uses Remodel to trash Feodum to gain Silvers
{
  name: 'RemodelFeodum'
  author: 'Svatal'
  requires: ["Feodum", "Remodel", "Squire"]
  gainPriority: (state, my) -> [
    "Province" 
    "Feodum" if state.gainsToEndGame() <= 5
    "Duchy" if state.gainsToEndGame() <= 5
    "Silver" if state.gainsToEndGame() <= 5 and my.countInDeck("Feodum") >= 3
    "Estate" if state.gainsToEndGame() <= 2
    "Gold"
    "Remodel" if my.countInDeck("Remodel") < 2
    "Feodum"
    "Silver"
    "Squire"
  ]  
  upgradePriority: (state, my) -> [
    ["Gold", "Province"] if state.gainsToEndGame() <= 5
    ["Feodum", "Gold"] if (3 * my.countInDeck("Feodum")) > my.countInDeck("Silver") and state.gainsToEndGame() > 5
    ["Feodum", "Feodum"] if (3 * my.countInDeck("Feodum")) > my.countInDeck("Silver") and state.gainsToEndGame() <= 5
    ["Feodum", "Duchy"] if (3 * my.countInDeck("Feodum")) > my.countInDeck("Silver") and state.gainsToEndGame() <= 5
    ["Estate", "Feodum"]
    ["Squire", "Feodum"]
    ["Curse", "Squire"]
    ["Copper", "Squire"]
  ]
}
