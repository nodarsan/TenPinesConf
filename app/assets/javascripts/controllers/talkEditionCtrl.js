tenPinesConfControllers.controller('TalkEditionCtrl', ['$scope', '$routeParams', 'talkRepository',
    function($scope, $routeParams, talkRepository) {
        var talkId = $routeParams.id;
        talkRepository.getTalkConfigData().success(function(data) {
            $scope.talkConfigs = data;
        });
        talkRepository.getTalkData(talkId).success(function(data) {
            $scope.talkData = data;
        });
        $scope.submitEdition = function () {
            talkRepository.submitEdition($scope.talkData).success(function() {
                alert('Talk data modified.');
            });
        };
    }]);