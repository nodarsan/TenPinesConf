tenPinesConfControllers.controller('TalkProposalCtrl', ['$scope', '$location', 'talkRepository',
    function($scope, $location, talkRepository) {
        if (!$scope.logged_in_as_speaker){
            $location.path('/login')
        }
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
                $location.path('/my-talks');
            });
        };
    }]);