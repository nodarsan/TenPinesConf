tenPinesConfControllers.controller('SpeakerRegisterCtrl', ['$scope', '$http', 'talkRepository',
    function($scope, $http) {
        $scope.speakerRegistrationData = {};

        $scope.submitRegistration = function () {
            $http.post('/register_speaker', $scope.speakerRegistrationData).
                success(function(data) {
                    alert('Thank you for registering.');
            });
        };
    }]);