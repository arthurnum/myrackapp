var myRackApp = angular.module('myRackApp', ['ngRoute']);

myRackApp.config(function ($routeProvider) {
  $routeProvider
    .when('/agents', {
    	controller: 'AgentsController',
    	templateUrl: '/templates/agents.html'
    	})
      .otherwise({
      redirectTo: '/'
    });
});
