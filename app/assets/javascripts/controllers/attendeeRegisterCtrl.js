/**
 * Created by memonono on 16/12/14.
 */
tenPinesConfControllers.controller('attendeeRegisterCtrl', ['$scope', '$http', '$location',
    function($scope, $http, $location) {
        $scope.attendeeRegistrationData = {};

        $scope.submitRegistration = function () {
            $http.post('/register_attendee', $scope.attendeeRegistrationData).
                success(function(data) {
                    alert('Thank you for registering.');
                    $http.post('/login_attendee',{email: data.email,password:data.password});
                    $location.path('/payment');
                }).
                error(function (status) {
                    alert('User already exists.');
                });
        };
    }]);