/**
 * Created by memonono on 16/12/14.
 */
tenPinesConfControllers.controller('loginAttendeeCtrl', ['$scope', '$location', 'authenticationAttendee',
    function($scope, $location, authenticationAttendee) {
        $scope.login = function() {
            authenticationAttendee.login($scope.email, $scope.password);
        };
    }]);