CliStatusView = require './cli-status-view'

module.exports =
  cliStatusView: null

  activate: (state) ->
    createStatusEntry = =>
      @cliStatusView = new CliStatusView(state.cliStatusViewState)

    if atom.views.getView(atom.workspace).statusBar
      createStatusEntry()
    else
      atom.packages.onDidActivateInitialPackages ->
        createStatusEntry()

  deactivate: ->
    @cliStatusView.destroy()

  config:
    'windowHeight':
      type: 'integer'
      default: 30
      minimum: 0
      maximum: 80
    'clearCommandInput':
      type: 'boolean'
      default: true
    'logConsole':
      type: 'boolean'
      default: false
    'overrideLs':
      title: 'Override ls'
      type: 'boolean'
      default: true
