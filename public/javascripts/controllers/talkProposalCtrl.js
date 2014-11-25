var tenPinesConfControllers = angular.module('tenPinesConfControllers');

tenPinesConfControllers.controller('TalkProposalCtrl', ['$scope', '$http',
    function($scope, $http) {
        $scope.newTalkData;
        $scope.talkConfigs;
        $http.get('talk_config.json').success(function(data) {
            $scope.talkConfigs = data;
        });

        $scope.submitProposal = function () {
            $http.post('register_talk', $scope.newTalkData).success(function() {
                alert('Thank you for your proposal.');
            });
        };
    }]);