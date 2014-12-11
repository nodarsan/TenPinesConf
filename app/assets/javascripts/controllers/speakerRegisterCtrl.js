tenPinesConfControllers.controller('SpeakerRegisterCtrl', ['$scope', '$http', '$location',
    function($scope, $http, $location) {
        $scope.speakerRegistrationData = {};

        $scope.submitRegistration = function () {
            $http.post('/register_speaker', $scope.speakerRegistrationData).
                success(function(data) {
                    alert('Thank you for registering.');
                    $location.path('/landing');
            }).
            error(function (status) {
                    alert('User already exists.');
                });
        };
    }]);