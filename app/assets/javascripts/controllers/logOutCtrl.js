tenPinesConfControllers.controller('LogOutCtrl', ['$scope', 'authentication',
    function($scope, authentication) {
        authentication.logout();
        alert('Bye bye! :)');
    }]);