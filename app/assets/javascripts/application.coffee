#= require jquery
#= require jquery_ujs
#= require backbone-rails

#= require_tree ./shared
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./templates
#= require_tree ./views

#= require_self

class window.TodoApp extends Backbone.Router
  urlRoot: '/things'
  initialize: ->
    @_history_start()

  routes:
    '':    'show_index'
    ':id': 'show_me_the_id'


  show_index: ->
    window.things_view = new Todo.ThingsView()

  show_me_the_id: (id) ->
    alert id


  _history_start: (pushState = false) ->
    options = if pushState then root: @urlRoot, pushState: true else {}
    Backbone.history.start options


window.todo_app = new window.TodoApp