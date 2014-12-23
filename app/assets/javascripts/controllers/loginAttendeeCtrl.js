tenPinesConfControllers.controller('loginAttendeeCtrl', ['$scope', '$location', 'authentication',
    function($scope, $location, authentication) {
        $scope.login = function() {
            authentication.login_as_attendee($scope.email, $scope.password).then(
                function(){
                    $location.path('/landing')
                },
                function(error){
                    alert(error)
                });
        };
        $scope.forgotPassword = function () {
            authentication.forgot_password_attendee($scope.email);
        };
    }]);