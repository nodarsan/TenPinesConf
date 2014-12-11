/**
 * Created by memonono on 09/12/14.
 */
tenPinesConfControllers.controller('MyTalksCtrl', ['$scope', '$http', 'talkRepository',
    function ($scope, $http, talkRepository) {
        talkRepository.getMyTalks().success(function(data) {
            $scope.talks = data;
        });
        talkRepository.getTalkConfigData().success(function(data) {
            $scope.tracks = data.tracks;
        });
        $scope.toggleBio = function (talk) {
            talk.toggle = !talk.toggle;
        };
    }]);