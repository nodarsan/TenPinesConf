tenPinesConfServices.factory('talkRepository',['$http', '$resource', function($http) {
    return {
        getTalkConfigData: function() {
            return $http.get('talk_config.json');
        },
        getAllTalks: function() {
            return  $http.get('talk_list.json');
        },
        submitTalkProposal: function(newTalkData) {
            return $http.post('register_talk', newTalkData);
        },
        getMyTalks: function () {
            return $http.get('my_talks.json')
        }
    }
}]);