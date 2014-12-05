tenPinesConfControllers.controller('LoginCtrl', ['$scope', '$http', '$rootScope','$location', 'authentication' ,
    function($scope, $http, $rootScope, $location) {
        $scope.login = function() {
            var data = {email: $scope.email, password: $scope.password};
            $http.post('login', data).success(function(){
                $location.path('/landing');
            });

        };
        $scope.logOut = function () {
            $http.get('log_out').success(function () {
                alert('Bye bye! :)');
            });
        }
}]);