myRackApp.controller('AgentsController', AgentsController);

function AgentsController($scope, $http) {
  $http.get('/hi')
    .success(
      function(data) {
        $scope.data_set = data;
      }
    );
}
