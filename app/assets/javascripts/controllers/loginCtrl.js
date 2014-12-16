tenPinesConfControllers.controller('LoginCtrl', ['$scope', '$location', 'authentication',
    function($scope, $location, authentication) {
        $scope.login = function() {
            authentication.login_as_speaker($scope.email, $scope.password);
            $location.path('/landing');
        };
}]);