tenPinesConfControllers.controller('TalkProposalCtrl', ['$scope', '$http', 'talkRepository',
    function($scope, $http, talkRepository) {
        $scope.newTalkData = {};

        talkRepository.getTalkConfigData().success(function(data) {
            $scope.talkConfigs = data;
            $scope.newTalkData = {
                talk: {
                    duration: $scope.talkConfigs.durations[0],
                    track: $scope.talkConfigs.tracks[0]}};
        });

        $scope.submitProposal = function () {
            talkRepository.submitTalkProposal($scope.newTalkData).success(function() {
                alert('Thank you for your proposal.');
            });
        };
    }]);