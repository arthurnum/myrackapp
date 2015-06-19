myRackApp.controller('AgentsController', AgentsController);

function AgentsController($scope, $http) {
  $http.get('/hi')
    .success(
      function(data) {
        $scope.data_set = data;
      }
    );

  $scope.submitNewAgent = function() {
    data = {
      name: $scope.newAgentName
    };
    $http.post('/hi', data)
      .success(
        function(data) {
          $scope.data_set = data;
        }
      );
  }
}
