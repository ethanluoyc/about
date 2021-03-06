{CompositeDisposable} = require 'atom'

AboutView = null

aboutURI = 'atom://about'

createAboutView = (state) ->
  AboutView ?= require './about-view'
  new AboutView(state)

atom.deserializers.add
  name: 'AboutView'
  deserialize: (state) -> createAboutView(state)

module.exports = About =
  activate: ->
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.workspace.addOpener (uriToOpen) ->
      createAboutView(uri: uriToOpen) if uriToOpen is aboutURI

  deactivate: ->
    @subscriptions.dispose()
