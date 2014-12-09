/**
 * Created by memonono on 05/12/14.
 */
tenPinesConfServices.factory('authentication',['$http', '$rootScope', '$location', function($http, $rootScope, $location) {
    $rootScope.loggedUser = null ;
    $http.get('/logged_user').success(function (data) {
        $rootScope.logged_in = true;
        $rootScope.user_email = data;
    });
    return {
        login: function(email, password) {
            $http.post('login', {email: email , password: password }).success(function(){
                $rootScope.logged_in = true;
                $rootScope.user_email = email;
                $location.path('/landing');
            })},
        logout: function() {
            $http.get('log_out').success(function () {
                $rootScope.logged_in = false;
                alert('Bye bye! :)');
            });
        }


        }
}]);