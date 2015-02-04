window.ModelFindrApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');
    new ModelFindrApp.Routers.UserRouter;
    Backbone.history.start();
  }
};

$(document).ready(function(){
  ModelFindrApp.initialize();
});
