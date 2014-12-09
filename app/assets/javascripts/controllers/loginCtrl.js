tenPinesConfControllers.controller('LoginCtrl', ['$scope', '$http', '$rootScope','$location', 'authentication',
    function($scope, $http, $rootScope, $location, authentication) {
        $scope.login = function() {
            var data = {email: $scope.email, password: $scope.password};
            authentication.login(data.email,data.password)
        };

}]);