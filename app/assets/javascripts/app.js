var stocksApp = angular.module('stocksApp', [
    'ngRoute',
    'stocksServices',
    'stocksControllers'
]);

var TEMPLATES_PATH = '/templates';

stocksApp.config(['$routeProvider',
    function ($routeProvider) {
        $routeProvider.
            when('/categories', {
                templateUrl: TEMPLATES_PATH + '/categories.html',
                controller: 'CategoryListCtrl'
            }).
            when('/categories/:categoryId', {
                templateUrl: TEMPLATES_PATH + '/category_products.html',
                controller: 'CategoryProductsCtrl'
            }).
            when('/products/:productId', {
                templateUrl: TEMPLATES_PATH + '/edit_product.html',
                controller: 'EditProductCtrl'
            }).
            when('/add_product/:categoryId', {
                templateUrl: TEMPLATES_PATH + '/edit_product.html',
                controller: 'AddProductCtrl'
            }).
            otherwise({
                redirectTo: '/categories'
            });
    }]);