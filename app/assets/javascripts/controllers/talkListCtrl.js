tenPinesConfControllers.controller('TalkListCtrl', ['$scope', '$http', 'talkRepository',
    function ($scope, $http, talkRepository) {

        talkRepository.getAllTalks().success(function(data) {
           $scope.talks = data;
        });
        $scope.tracks = talkRepository.getTalkConfigData(); /*.success(function(data) {
            $scope.tracks = data.tracks;
        });*/
        $scope.toggleBio = function (talk) {
            talk.toggle = !talk.toggle;
        }
}]);