tenPinesConfControllers.controller('SpeakerRegisterCtrl', ['$scope', '$http',
    function($scope, $http) {
        $scope.speakerRegistrationData = {};

        $scope.submitRegistration = function () {
            $http.post('/register_speaker', $scope.speakerRegistrationData).
                success(function(data) {
                    alert('Thank you for registering.');
            }).
            error(function (status) {
                    alert('User already exists.');
                });

        };
    }]);