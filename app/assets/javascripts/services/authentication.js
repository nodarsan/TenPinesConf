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

    var forgot_password = function(url,email) {
        $http.post(url,{email: email}).success(function () {
            alert('Your new password has been sent to your email account!');
        }).error(function () {
            alert('An error occurred, check the email has correctly written and retry');
        });
    };

    return {
        login_as_speaker: function(email, password) {
            $http.post('login_speaker.json', {email: email , password: password }).success(function(){
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
            $http.get('logout_speaker.json').success(function () {
                $rootScope.logged_in = false;
                $rootScope.logged_in_as_speaker = false;
                $rootScope.logged_in_as_attendee = false;
            });
            $http.get('logout_attendee.json').success(function () {
                $rootScope.logged_in = false;
                $rootScope.logged_in_as_speaker = false;
                $rootScope.logged_in_as_attendee = false;
            })},
        forgot_password_speaker: function(email) {
            forgot_password('/forgot_password_speaker',email);
        },
        forgot_password_attendee: function(email) {
            forgot_password('/forgot_password_attendee',email);
        }

    }
}]);