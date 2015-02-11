ModelFindrApp.Views.Navbar = Backbone.View.extend({
  template: JST['navbar'],

  events: {
    "click #logo": "exploreImgsPage",
    "click #sign-out": "signOut",
    'click #profile': "profilePage",
    'click #explore': "exploreImgsPage",
    'click #your-city': "cityImgsPage",
    'click #search-btn': "searchUserOrImgs",
    'change #city-or-users': 'changeAutoComplete'
  },

  initialize: function() {
    // this.installHandlers();
    this.completion = "city";
  },

  render: function() {
    this.$el.addClass("navbar")
    this.$el.attr("id", "navbar")
    this.$el.html(this.template())
    this.installCompletionEngine();
    return this;
  },

  signOut: function() {
    $.ajax({
      url: "/session",
      dataType: "json",
      method: "DELETE",
      success: function() {
        window.location = "/session/new";
      }
    });
  },

  profilePage: function() {
    Backbone.history.navigate('users/' + ModelFindrApp.currentUserId, {trigger: true})
  },

  exploreImgsPage: function(event) {
    event.preventDefault();

    Backbone.history.navigate("explore_imgs", {trigger: true});
  },

  cityImgsPage: function(event) {
    event.preventDefault();

    Backbone.history.navigate("city_imgs", {trigger: true});
  },

  searchUserOrImgs: function(event) {
    event.preventDefault();


    if ($('#city-or-users').val() === "city") {
      var city = $('#searchTextField').val();

      Backbone.history.navigate(encodeURI(city) + "/imgs", {trigger: true})
    } else {
      var username = $('#searchTextField').val();
      var user = new ModelFindrApp.Models.User({id: 1});
      user.fetch({
        data: {username: username },
        success: function() {
          Backbone.history.navigate("users/" + user.id, {trigger: true})
        }
      })
    }
  },

  initGMapsAutoComplete: function(){
    this.$('.twitter-typeahead').remove();
    $("<input type='text' id='searchTextField' placeholder=' i.e. San Francisco, CA, United States'>").insertAfter("#city-or-users")
      var options = {
        types: ['(cities)'],
        componentRestrictions: {country: "us"}
      };

      var input = this.$('#searchTextField')[0];
      var autocomplete = new google.maps.places.Autocomplete(input, options);
  },

  changeAutoComplete: function(event){
    event.preventDefault();
    this.completion = $(event.currentTarget).val();
    this.installCompletionEngine();
  },

  installCompletionEngine: function(){
    if(this.completion == 'city'){
      this.initGMapsAutoComplete();
    } else {
      this.initModelAutoComplete();
    }
  },

  initModelAutoComplete: function(){
          this.$('#searchTextField').remove()
          $("<input type='text' id='searchTextField' value='' placeholder=' i.e. iamgalla'>").insertAfter("#city-or-users")

          var substringMatcher = function(strs) {
            return function findMatches(q, cb) {
              var matches, substrRegex;

              // an array that will be populated with substring matches
              matches = [];

              // regex used to determine if a string contains the substring `q`
              substrRegex = new RegExp(q, 'i');

              // iterate through the pool of strings and for any string that
              // contains the substring `q`, add it to the `matches` array
              $.each(strs, function(i, str) {
                if (substrRegex.test(str)) {
                  // the typeahead jQuery plugin expects suggestions to a
                  // JavaScript object, refer to typeahead docs for more info
                  matches.push({ value: str });
                }
              });

              cb(matches);
            };
          };

          var states = ModelFindrApp.USERNAMES;

          this.$('#searchTextField').typeahead({
            // hint: false,
            highlight: true,
            minLength: 1
          },
          {
            name: 'states',
            displayKey: 'value',
            source: substringMatcher(states)
          })
  },

})
