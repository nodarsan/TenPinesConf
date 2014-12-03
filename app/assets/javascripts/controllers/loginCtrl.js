tenPinesConfControllers.controller('LoginCtrl', ['$scope', '$http',
    function($scope, $http) {
        $scope.login = function() {
            data = {email: $scope.email, password: $scope.password};
            $http.post('login', data);
        };
}]);