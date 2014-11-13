var tenPinesConfApp = angular.module('tenPinesConfApp', ['ngRoute', 'tenPinesConfControllers']);

tenPinesConfApp.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
            when('/landing', {
                templateUrl: 'templates/landing_page.html'
            }).
            when('/talk-proposal', {
                templateUrl: 'templates/talk_proposal.html'
            }).
            otherwise({
                redirectTo: '/landing'
            });
    }]);

var tenPinesConfControllers = angular.module('tenPinesConfControllers', []);