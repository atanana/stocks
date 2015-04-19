var stocksServices = angular.module('stocksServices', ['ngResource']);

stocksServices.service('Category', ['$resource', function($resource) {
    return $resource('/categories/:categoryId', {}, {
        all: {
            method: 'GET',
            isArray: true
        },
        remove: {
            method: 'DELETE'
        },
        insert: {
            method: 'POST',
            params: {
                name: '@name'
            }
        },
        update: {
            method: 'PUT',
            params: {
                name: '@name'
            }
        },
        products: {
            method: 'GET',
            isArray: true
        }
    });
}]);

stocksServices.service('ProductType', ['$resource', function($resource) {
    return $resource('/product_types/:productTypeId', {}, {
        all: {
            method: 'GET',
            isArray: true
        }
    });
}]);

stocksServices.service('ProductPackings', ['$resource', function($resource) {
    return $resource('/product_packings/:productPackingId', {}, {
        all: {
            method: 'GET',
            isArray: true
        }
    });
}]);

stocksServices.service('Product', ['$resource', function($resource) {
    return $resource('/products/:productId/:action', {}, {
        insert: {
            method: 'POST',
            params: {
                productTypeId: '@productTypeId',
                productPackingId: '@productPackingId',
                categoryId: '@categoryId'
            }
        },
        remove: {
            method: 'DELETE'
        },
        get: {
            method: 'GET'
        },
        update: {
            method: 'PUT',
            params: {
                productTypeId: '@productTypeId',
                productPackingId: '@productPackingId',
                productOpen: '@productOpen'
            }
        },
        open: {
            method: 'GET',
            params: {
                action: 'open'
            }
        },
        close: {
            method: 'GET',
            params: {
                action: 'close'
            }
        }
    });
}]);