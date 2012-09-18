class Todo.ThingsView extends Backbone.View
  template: JST['templates/thing']
  initialize: ->
    @things = new Todo.Things()
    @things.fetch()

    @things.on 'reset', @render, this
    @things.on 'add', @add, this

    $("body").html @$el


  render: ->
    @things.each (thing) =>
      @add thing


  add: (model) ->
    data = model.toJSON()
    @$el.append @template data