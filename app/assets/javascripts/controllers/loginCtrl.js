tenPinesConfControllers.controller('LoginCtrl', ['$scope', '$location', 'authentication',
    function($scope, $location, authentication) {
        $scope.login = function() {
            authentication.login($scope.email, $scope.password);
            $location.path('/landing');
        };
}]);