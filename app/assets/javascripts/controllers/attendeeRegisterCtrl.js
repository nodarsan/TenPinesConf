/**
 * Created by memonono on 16/12/14.
 */
tenPinesConfControllers.controller('attendeeRegisterCtrl', ['$scope', '$http', '$location',
    function($scope, $http, $location) {
        $scope.attendeeRegistrationData = {};

        $scope.submitRegistration = function () {
            $http.post('/register_attendee', $scope.attendeeRegistrationData).
                success(function() {
                    alert('Thank you for registering.');
                    $http.post('/login_attendee',{email: $scope.attendeeRegistrationData.mail,password:$scope.attendeeRegistrationData.password});
                    $location.path('/payment');
                }).
                error(function (status) {
                    alert('User already exists.');
                });
        };
    }]);