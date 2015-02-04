window.ModelFindrApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new ModelFindrApp.Routers.UserRouter;
    Backbone.history.start();
  }
};

$(document).ready(function(){
  ModelFindrApp.initialize();
});
