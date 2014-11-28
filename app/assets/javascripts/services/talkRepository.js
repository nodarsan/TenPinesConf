tenPinesConfServices.factory('talkRepository',['$http', '$resource', function($http, $resource) {
    return {
        getTalkConfigData: function() {
            return $resource('talk_config.json').get();
//            return $http.get('talk_config.json');
        },
        getAllTalks: function() {
            return  $http.get('talk_list.json');
        },
        submitTalkProposal: function(newTalkData) {
            return $http.post('register_talk', newTalkData);
        }
    }
}]);