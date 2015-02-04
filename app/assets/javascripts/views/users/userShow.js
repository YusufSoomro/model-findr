ModelFindrApp.Views.UserShow = Backbone.View.extend({
  template: JST['users/show'],
  tagName: 'div',

  attrsToDisplay: ["gender", "skill_type", "city", "email"],

  initialize: function(options) {
    this.model = options.model;
    this.listenTo(this.model, "sync", this.render)
  },

  render: function() {
    this.$el.attr('id', 'user-show-page');
    this.$el.html(this.template({user: this.model}));

    _.each(this.attrsToDisplay, function(atr) {
      var infoLI = $("<li>" + this.model.get(atr) + "</li>")
      this.$('#user-gen-info-list').append(infoLI)
    }, this);

    return this;
  }
})
