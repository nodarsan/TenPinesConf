var tenPinesConfApp = angular.module('tenPinesConfApp', ['ngRoute', 'ngAnimate', 'tenPinesConfControllers', 'tenPinesConfServices']);

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
            when('/talk-list', {
                templateUrl: 'template/talk_list.html',
                controller: 'TalkListCtrl'
            }).
            otherwise({
                redirectTo: '/landing'
            });
    }]);

var tenPinesConfControllers = angular.module('tenPinesConfControllers', []);
var tenPinesConfServices = angular.module('tenPinesConfServices', ['ngResource']);