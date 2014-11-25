var tenPinesConfApp = angular.module('tenPinesConfApp', ['ngRoute', 'tenPinesConfControllers']);

tenPinesConfApp.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
            when('/landing', {
                templateUrl: 'template/landing_page.html'
            }).
            when('/talk-proposal', {
                templateUrl: 'template/talk_proposal.html',
                controller: 'TalkProposalCtrl'
            }).
            otherwise({
                redirectTo: '/landing'
            });
    }]);

var tenPinesConfControllers = angular.module('tenPinesConfControllers', []);