/**
 * Created by memonono on 15/12/14.
 */
tenPinesConfControllers.controller('paymentCtrl',['$scope', '$http',function($scope, $http){
    $scope.show = false;

    $scope.buyTicket = function(){
        Stripe.setPublishableKey('pk_test_WADN4tdKDvOZiy1VuHh3ArkB');
        Stripe.card.createToken({
            name: $scope.name,
            address_line1: $scope.address,
            number: $scope.cardNumber,
            cvc: $scope.cardCvc,
            exp_month: $scope.cardExpiryMonth,
            exp_year: $scope.cardExpiryYear
        }, stripeResponseHandler);
    };

    var stripeResponseHandler = function(status, response){
        if(response.error){
            alert('Operation could not be completed:' + response.error.message);
        } else {
            $http.post('/payment.json', {stripeToken: response.id}).success(function(data){
                alert('Thanks for buy! :)');
            }).error(function(data) {
                alert('Operation could not be completed:' + data)
            });
        }
    };

}]);