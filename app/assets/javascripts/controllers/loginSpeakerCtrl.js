tenPinesConfControllers.controller('loginSpeakerCtrl', ['$scope', '$location', 'authentication',
    function($scope, $location, authentication) {
        $scope.login = function() {
            authentication.login_as_speaker($scope.email, $scope.password)
                .then(function(){
                    $location.path('/landing')
                }, function(reason) {
                    alert(reason)
                })
        };

        $scope.forgotPassword = function () {
            authentication.forgot_password_speaker($scope.email);
        };
        $scope.changePassword = function() {
            authentication.change_password_speaker($scope.currentPassword, $scope.newPassword, $scope.repeatNewPassword)
                .success(function() {
                    alert('Password changed successfully.')
                })
                .error(function() {
                    alert('Password could not be changed.')
                })
        }
}]);