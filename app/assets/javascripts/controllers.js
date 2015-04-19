var stocksControllers = angular.module('stocksControllers', []);

stocksControllers.controller('CategoryListCtrl', ['$scope', 'Category', function($scope, Category) {
    $scope.newCategory = '';

    function updateCategories() {
        $scope.categories = Category.all();
    }

    updateCategories();

    $scope.deleteCategory = function(categoryId) {
        Category.remove({categoryId: categoryId});
        updateCategories();
    };

    $scope.addCategory = function() {
        Category.insert({name: $scope.newCategory});
        updateCategories();
    };

    $scope.editCategory = function(categoryId, oldName) {
        Category.update({categoryId: categoryId}, {
            name: prompt('Введите новое имя категории', oldName)
        });
        updateCategories();
    };
}]);

stocksControllers.controller('CategoryProductsCtrl', ['$scope', '$routeParams', '$location', 'Category', 'Product',
    function($scope, $routeParams, $location, Category, Product) {
        function loadProducts() {
            $scope.products = Category.products({categoryId: $routeParams.categoryId});
        }

        loadProducts();

        $scope.categoryId = $routeParams.categoryId;

        $scope.deleteProduct = function(productId) {
            Product.remove({productId: productId});
            loadProducts();
        };

        $scope.editProduct = function(productId) {
            $location.path('products/' + productId);
        };

        $scope.toggleProduct = function(product) {
            var params = {productId: product.id};
            var action;

            if (product.open)
                action = Product.close(params);
            else
                action = Product.open(params);

            action.$promise.then(function(response) {
                loadProducts();
            });
        }
    }]);

stocksControllers.controller('AddProductCtrl', ['$scope', '$routeParams', '$window', 'ProductType', 'ProductPackings', 'Product',
    function($scope, $routeParams, $window, ProductType, ProductPackings, Product) {
        $scope.productTypes = ProductType.all();
        $scope.productPackings = ProductPackings.all();

        $scope.save = function() {
            Product.insert({
                productTypeId: $scope.productTypeId,
                productPackingId: $scope.productPackingId,
                categoryId: $routeParams.categoryId
            }).$promise.then(function(response) {
                    if (response.inserted) {
                        noty({
                            text: 'Продукт сохранён!',
                            type: 'success'
                        });

                        $window.history.back();
                    }
                    else
                        noty({
                            text: 'Продукт не сохранён!',
                            type: 'error'
                        });
                });
        }
    }]);

stocksControllers.controller('EditProductCtrl', ['$scope', '$routeParams', '$window', 'ProductType', 'ProductPackings', 'Product',
    function($scope, $routeParams, $window, ProductType, ProductPackings, Product) {
        $scope.productTypes = ProductType.all();
        $scope.productPackings = ProductPackings.all();

        Product.get({productId: $routeParams.productId}).$promise.then(function(response) {
            $scope.product = response;
        });

        $scope.save = function() {
            Product.update({productId: $routeParams.productId}, {
                productTypeId: $scope.product.type,
                productPackingId: $scope.product.packing,
                productOpen: $scope.product.open ? 1 : 0
            }).$promise.then(function(response) {
                    if (response.edited) {
                        noty({
                            text: 'Продукт сохранён!',
                            type: 'success'
                        });

                        $window.history.back();
                    }
                    else
                        noty({
                            text: 'Продукт не сохранён!',
                            type: 'error'
                        });
                });
        }
    }]);