var tenPinesConfApp = angular.module('tenPinesConfApp', ['ngRoute', 'ngCookies', 'tenPinesConfControllers', 'tenPinesConfServices']);

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
            when('/register', {
                templateUrl: 'template/register_page.html',
                controller: 'SpeakerRegisterCtrl'
            }).
            when('/login', {
                templateUrl: 'template/login_page.html',
                controller: 'LoginCtrl'
            }).
            when('/logout',{
                templateUrl: 'template/landing_page.html',
                controller: 'LogOutCtrl'
            }).
            otherwise({
                redirectTo: '/landing',
                controller: 'LoginCtrl'
            });
    }]);

tenPinesConfApp.config(['$httpProvider', function($httpProvider){
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = angular.element(document.querySelector('meta[name=csrf-token]')).attr('content');
}]);

tenPinesConfApp.run(['authentication', function(authentication){}]);
var tenPinesConfServices = angular.module('tenPinesConfServices', ['ngResource']);
var tenPinesConfControllers = angular.module('tenPinesConfControllers', []);
