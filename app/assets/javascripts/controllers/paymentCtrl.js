/**
 * Created by memonono on 15/12/14.
 */
tenPinesConfControllers.controller('paymentCtrl',['$scope', '$http',function($scope, $http){
    $scope.show = false;

    $scope.buyTicket = function(){
        Stripe.setPublishableKey('pk_test_WADN4tdKDvOZiy1VuHh3ArkB');
        Stripe.card.createToken({
            number: $scope.cardNumber,
            cvc: $scope.cardCvc,
            exp_month: $scope.cardExpiryMonth,
            exp_year: $scope.cardExpiryYear
        }, stripeResponseHandler);
    };

    var stripeResponseHandler = function(status, response){
        $http.post('/payment.json', {stripeToken: response.id}).success(function(data){
            alert('Thanks for buy! :)');
        });
    };

}]);