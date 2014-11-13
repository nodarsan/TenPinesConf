describe('talkProposalCtrl', function() {

    beforeEach(module('tenPinesConfApp'));

    beforeEach(inject(function($injector) {
        $httpBackend = $injector.get('$httpBackend');

        testConfig = {tracks: [{id: 1, name: 'agile'}, {id: 2, name: 'technology'}],
            durations: [30, 60]};
        $httpBackend.when('GET', 'talk_config.json')
            .respond(testConfig);

        scope = $injector.get('$rootScope');

        var $controller = $injector.get('$controller');
        startController = function() {
            return $controller('TalkProposalCtrl', {'$scope' : scope});
        };
    }));

    it('should fetch talk configs options', function() {
        $httpBackend.expectGET('talk_config.json');
        startController();
        $httpBackend.flush();
        expect(scope.talkConfigs).toEqual(testConfig);
    });

    it('should start with an empty form', function() {
        $httpBackend.expectGET('talk_config.json');
        startController();
        expect(scope.newTalkData).toEqual({});
    });

    it('should send form data through a POST request when submitting and show alert with thank you', function() {
        spyOn(window, 'alert');
        testData = {
            person: {name: "Santi Nodar",
                mail: "snodar@10pines.com",
                phone: "456781239", country:"Argentina",
                bio:"Apprentice, developer, etc."},
            talk: {title: "Angular Thingies",
                description: "Some Description...",
                track: 2,
                duration: 30}};
        $httpBackend.expectPOST('register_talk', testData).respond(200, '');

        startController();
        scope.newTalkData = testData;
        scope.submitProposal();

        $httpBackend.flush();
        expect(window.alert).toHaveBeenCalledWith('Thank you for your proposal.');
    })
});