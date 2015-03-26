App.ApplicationView = Ember.View.extend
  didInsertElement: ->
    # Admin LTE functionality insert
    o = $.AdminLTE.options

    $.AdminLTE.pushMenu o.sidebarToggleSelector

    # TODO: Just use the commented line when following PR will be merged with a stable tag: https://github.com/almasaeed2010/AdminLTE/pull/304
    # $.AdminLTE.boxWidget.activate()
    $(document).on 'click', o.boxWidgetOptions.boxWidgetSelectors.collapse, (e) ->
      e.preventDefault()
      $.AdminLTE.boxWidget.collapse $(@)

    $(document).on 'click', o.boxWidgetOptions.boxWidgetSelectors.remove, (e) ->
      e.preventDefault()
      $.AdminLTE.boxWidget.remove $(@)
