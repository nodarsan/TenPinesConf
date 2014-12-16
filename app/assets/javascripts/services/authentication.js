tenPinesConfServices.factory('authentication',['$http', '$rootScope', function($http, $rootScope) {
    $rootScope.loggedUser = null ;
    $http.get('/logged_speaker.json').success(function (data) {
        $rootScope.logged_in = true;
        $rootScope.logged_in_as_speaker = true;
        $rootScope.logged_in_as_attendee = false;
        $rootScope.user_email = data;
    });
    $http.get('/logged_attendee.json').success(function (data) {
        $rootScope.logged_in = true;
        $rootScope.logged_in_as_speaker = false;
        $rootScope.logged_in_as_attendee = true;
        $rootScope.user_email = data;
    });
    return {
        login_as_speaker: function(email, password) {
            $http.post('login_as_speaker.json', {email: email , password: password }).success(function(){
                $rootScope.logged_in = true;
                $rootScope.logged_in_as_speaker = true;
                $rootScope.logged_in_as_attendee = false;
                $rootScope.user_email = email;
            })},
        login_as_attendee: function(email, password) {
            $http.post('login_attendee.json', {email: email , password: password }).success(function(){
                $rootScope.logged_in = true;
                $rootScope.logged_in_as_speaker = false;
                $rootScope.logged_in_as_attendee = true;
                $rootScope.user_email = email;
            })},
        logout: function() {
            $http.get('log_out.json').success(function () {
                $rootScope.logged_in = false;
                $rootScope.logged_in_as_speaker = false;
                $rootScope.logged_in_as_attendee = false;
            });
            $http.get('log_out_attendee.json').success(function () {
                $rootScope.logged_in = false;
                $rootScope.logged_in_as_speaker = false;
                $rootScope.logged_in_as_attendee = false;
            })}
        }
}]);