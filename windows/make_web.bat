setlocal
cd ..
type playWeb.coffee basicAI.coffee cards.coffee gameState.coffee | coffee -c --stdio > web\playWeb.js
call coffee -c web\multiLog.coffee
call coffee -c web\scoreTracker.coffee
call coffee -c web\grapher.coffee
call coffee compileStrategies.coffee
