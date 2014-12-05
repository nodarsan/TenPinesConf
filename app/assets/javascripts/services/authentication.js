/**
 * Created by memonono on 05/12/14.
 */
tenPinesConfServices.factory('authentication',['$http', '$rootScope', function($http, $rootScope) {

    $rootScope.loggedUser = {} ;
    $http.get('/logged_user').success(function (data) {
            $rootScope.loggedUser = data;
    });
}]);