var tenPinesConfApp = angular.module('tenPinesConfApp', ['ngRoute', 'ngCookies', 'tenPinesConfControllers', 'tenPinesConfServices']);

tenPinesConfApp.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
            when('/landing', {
                templateUrl: 'template/landing_page.html',
                controller: 'paymentCtrl'
            }).
            when('/talk-proposal', {
                templateUrl: 'template/talk_proposal.html',
                controller: 'TalkProposalCtrl'
            }).
            when('/talk-list', {
                templateUrl: 'template/talk_list.html',
                controller: 'TalkListCtrl'
            }).
            when('/my-talks', {
                templateUrl: 'template/my_talks_list.html',
                controller: 'MyTalksCtrl'
            }).
            when('/talk-edition/:id', {
                templateUrl: 'template/talk_edition.html',
                controller: 'TalkEditionCtrl'
            }).
            when('/register', {
                templateUrl: 'template/home_register_page.html'
            }).
            when('/register-speaker', {
                templateUrl: 'template/register_page.html',
                controller: 'SpeakerRegisterCtrl'
            }).
            when('/register-attendee', {
                templateUrl: 'template/register_attendee_page.html',
                controller: 'attendeeRegisterCtrl'
            }).
            when('/login', {
                templateUrl: 'template/home_login_page.html'
            }).
            when('/login-speaker',{
                templateUrl: 'template/login_speaker_page.html',
                controller: 'LoginCtrl'
            }).
            when('/login-attendee', {
                templateUrl: 'template/login_attendee_page.html',
                controller: 'loginAttendeeCtrl'
            }).
            when('/logout', {
                templateUrl: 'template/landing_page.html',
                controller: 'LogOutCtrl'
            }).
            when('/payment', {
                templateUrl: 'template/payment.html',
                controller: 'paymentCtrl'
            }).
            otherwise({
                redirectTo: '/landing'
            });
    }]);

tenPinesConfApp.config(['$httpProvider', function($httpProvider){
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = angular.element(document.querySelector('meta[name=csrf-token]')).attr('content');
}]);

tenPinesConfApp.run(['authentication', function(authentication){}]);
var tenPinesConfServices = angular.module('tenPinesConfServices', ['ngResource']);
var tenPinesConfControllers = angular.module('tenPinesConfControllers', []);
