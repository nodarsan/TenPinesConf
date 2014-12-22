/**
 * Created by memonono on 16/12/14.
 */
tenPinesConfControllers.controller('loginAttendeeCtrl', ['$scope', '$location', 'authentication',
    function($scope, $location, authentication) {
        $scope.login = function() {
            authentication.login_as_attendee($scope.email, $scope.password);
            $location.path('/landing');
        };

        $scope.forgotPassword = function () {
            authentication.forgot_password_attendee($scope.email);
        };
    }]);