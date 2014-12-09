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
        },
        getTalkData: function(id) {
            return $http.get('talk/'+ id +'.json');
        },
        submitEdition: function(modifiedTalkData){
            return $http.post('edit_talk', modifiedTalkData);
        }
    }
}]);