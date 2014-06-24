var freshDonutApp = angular.module('donut-app', ['ngResource','ui.router', 'templates']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

// start of froyorouter
freshDonutApp.config(function($stateProvider, $urlRouterProvider) {
  //
  // For any unmatched url, redirect to /home
  $urlRouterProvider.otherwise("/donuts");
  //s
  // Now set up the states
  $stateProvider
    .state('donuts', {
      url: "/donuts",
      templateUrl: "donuts.html"
    })
    .state('newUser', {
      url: "/new",
      templateUrl: "newUser.html"
    })
    .state('signin', {
      url: "/signin",
      templateUrl: "signin.html"
    })
    .state('userprofile', {
      url: "/userprofile",
      templateUrl: "userprofile.html"
    })
  });
// end of froyorouter





freshDonutApp.factory('User', ['$resource', function($resource) {
  return $resource('/users/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
}])

freshDonutApp.factory('Donut', ['$resource', function($resource) {
  return $resource('/donuts/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
}])

freshDonutApp.controller('UserCtrl', ['User', '$scope', '$http', function(User, $scope) {
	$scope.users= [];

	$scope.newUser = new User();

	User.query(function(users) {
		$scope.users = users;
	});

	$scope.saveUser = function () {
		$scope.newUser.$save(function(user) {
		$scope.users.push(user)
		$scope.newUser = new User();
		});
	}

	// i'll need a $scope function to select the and hold the json data business info for the vendors.
	// this information will be push with the new user stuff.
	$scope.saveYelp = function(yelp) {
		yelp.details = true;
		yelp.editing = false;
	}

	$scope.saveYelp = function(yelp) {
		yelp.details = true;
		yelp.editing = false;
	}


}]) //end of UserCtrl

freshDonutApp.controller('DonutCtrl', ['Donut', '$scope', function(Donut, $scope) {
  $scope.donuts= [];

  $scope.newDonut = new User();

  Donut.query(function(users) {
    $scope.donuts = donuts;
  });

  // consists of saving users and donutType together
  $scope.saveDonut = function () {
	  console.log($scope.newDonut.name)
	  $scope.newDonut.$save(function(donut) {
	    $scope.donuts.push(donut)
	    $scope.newDonut = new Donut();
	  });
   }
   
}]) //end of UserCtrl
