tenPinesConfControllers.controller('loginAttendeeCtrl', ['$scope', '$location', 'authentication',
    function($scope, $location, authentication) {
        $scope.login = function() {
            authentication.login_as_attendee($scope.email, $scope.password)
                .then(function(){
                    $location.path('/landing')
                },
                function(error){
                    alert(error)
                });
        };
        $scope.forgotPassword = function () {
            authentication.forgot_password_attendee($scope.email);
        };
        $scope.changePassword = function() {
            authentication.change_password_attendee($scope.currentPassword, $scope.newPassword, $scope.repeatNewPassword)
                .success(function() {
                    alert('Password changed successfully.')
                })
                .error(function() {
                    alert('Password could not be changed.')
                })
        }
    }]);