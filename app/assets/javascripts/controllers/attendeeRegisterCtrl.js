/**
 * Created by memonono on 16/12/14.
 */
tenPinesConfControllers.controller('attendeeRegisterCtrl', ['$scope', '$http', '$location', 'authentication',
    function($scope, $http, $location, authentication) {
        $scope.attendeeRegistrationData = {};

        $scope.submitRegistration = function () {
            $http.post('/register_attendee', $scope.attendeeRegistrationData).
                success(function() {
                    alert('Thank you for registering.');
                    authentication.login_as_attendee($scope.attendeeRegistrationData.mail, $scope.attendeeRegistrationData.password);
                    $location.path('/payment');
                }).
                error(function (status) {
                    alert('User already exists.');
                });
        };
    }]);