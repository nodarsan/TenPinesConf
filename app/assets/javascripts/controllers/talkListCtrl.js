tenPinesConfControllers.controller('TalkListCtrl', ['$scope', '$http', 'talkRepository', '$rootScope',
    function ($scope, $http, talkRepository, $rootScope) {
        talkRepository.getAllTalks().success(function(data) {
           $scope.talks = data;
        });
        talkRepository.getTalkConfigData().success(function(data) {
            $scope.tracks = data.tracks;
        });
        $scope.toggleBio = function (talk) {
            talk.toggle = !talk.toggle;
        }
}]);