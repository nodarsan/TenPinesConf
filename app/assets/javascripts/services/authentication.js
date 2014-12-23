tenPinesConfServices.factory('authentication',['$http', '$rootScope', '$q', function($http, $rootScope, $q) {
    function set_as_logged_out() {
        $rootScope.logged_in = false;
        $rootScope.logged_in_as_speaker = false;
        $rootScope.logged_in_as_attendee = false;
        $rootScope.user_email = "";
    }
    function set_attendee_as_logged_in(email) {
        $rootScope.logged_in = true;
        $rootScope.logged_in_as_speaker = false;
        $rootScope.logged_in_as_attendee = true;
        $rootScope.user_email = email;
    }
    function set_speaker_as_logged_in(email) {
        $rootScope.logged_in = true;
        $rootScope.logged_in_as_speaker = true;
        $rootScope.logged_in_as_attendee = false;
        $rootScope.user_email = email;
    }

    $http.get('/logged_speaker.json').success(function (data) {
        set_speaker_as_logged_in(data);
    });

    $http.get('/logged_attendee.json').success(function (data) {
        set_attendee_as_logged_in(data);
    });

    function forgot_password(url,email) {
        $http.post(url,{email: email}).success(function () {
            alert('Your new password has been sent to your email account!');
        }).error(function () {
            alert('An error occurred, check the email has correctly written and retry');
        });
    };

    return {
        login_as_speaker: function(email, password) {
            var deferred = $q.defer();
            $http.post('login_speaker.json', {email: email , password: password }).success(function(){
                set_speaker_as_logged_in(email);
                deferred.resolve()
            }).error(function() {
                deferred.reject('Email or password invalid.')
            });
            return deferred.promise
        },
        login_as_attendee: function(email, password) {
            var deferred = $q.defer();
            $http.post('login_attendee.json', {email: email , password: password }).success(function(){
                set_attendee_as_logged_in(email);
                deferred.resolve()
            }).error(function() {
                deferred.reject('Email or password invalid.')
            });
            return deferred.promise
        },
        logout: function() {
            $http.get('logout_speaker.json').success(function () {
                set_as_logged_out();
            });
            $http.get('logout_attendee.json').success(function () {
                $rootScope.logged_in = false;
                $rootScope.logged_in_as_speaker = false;
                $rootScope.logged_in_as_attendee = false;
            })},
        forgot_password_speaker: function(email) {
            forgot_password('/forgot_password_speaker', email);
        },
        forgot_password_attendee: function(email) {
            forgot_password('/forgot_password_attendee', email);
        }
    }
}]);