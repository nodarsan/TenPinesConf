describe('talkListCtrl', function() {
    beforeEach(module('tenPinesConfApp'));

    beforeEach(inject(function($injector) {
        $httpBackend = $injector.get('$httpBackend');
        testList = [
            {
                title: 'A Very Nice Title',
                description: 'A lot of interesting and engaging things.',
                track: 'technology',
                duration: 30,
                person: {
                    name: 'Santi Nodar',
                    bio: 'A very interesting career, full of achievements.'}},
            {
                title: 'Yet another funny talk.',
                description: 'BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA',
                track: 'agile',
                duration: 60,
                person: {
                    name: 'John Doe',
                    bio: 'natalia natalia'}}];

        $httpBackend.when('GET', 'talk_list.json')
            .respond(testList);

        testConfig = {tracks: [{id: 1, name: 'agile'}, {id: 2, name: 'technology'}],
            durations: [30, 60]};
        $httpBackend.when('GET', 'talk_config.json')
            .respond(testConfig);

        scope = $injector.get('$rootScope');

        var $controller = $injector.get('$controller');
        startController = function() {
            return $controller('TalkListCtrl', {'$scope' : scope});
        };
    }));

    it('should fetch a talk list', function() {
        $httpBackend.expectGET('talk_list.json');
        startController();
        $httpBackend.flush();
        expect(scope.talks).toEqual(testList);
    });
});