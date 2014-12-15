tenPinesConfServices.factory('authentication',['$http', '$rootScope', function($http, $rootScope) {
    $rootScope.loggedUser = null ;
    $http.get('/logged_user.json').success(function (data) {
        $rootScope.logged_in = true;
        $rootScope.user_email = data;
    });
    return {
        login: function(email, password) {
            $http.post('login.json', {email: email , password: password }).success(function(){
                $rootScope.logged_in = true;
                $rootScope.user_email = email;
            })},
        logout: function() {
            $http.get('log_out.json').success(function () {
                $rootScope.logged_in = false;
            })}
        }
}]);