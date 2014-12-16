/**
 * Created by memonono on 16/12/14.
 */
tenPinesConfServices.factory('authenticationAttendee',['$http', '$rootScope', function($http, $rootScope) {
    $rootScope.loggedUser = null ;
    $http.get('/logged_user.json').success(function (data) {
        $rootScope.logged_in = true;
        $rootScope.user_email = data;
    });
    return {
        login: function(email, password) {
            $http.post('login_attendee.json', {email: email , password: password }).success(function(){
                $rootScope.logged_in = true;
                $rootScope.user_email = email;
            })},
        logout: function() {
            $http.get('log_out_attendee.json').success(function () {
                $rootScope.logged_in = false;
            })}
    }
}]);