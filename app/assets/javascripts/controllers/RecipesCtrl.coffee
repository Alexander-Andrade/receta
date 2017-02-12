controllers = angular.module('controllers')
controllers.controller("RecipesCtrl", [ '$scope', '$stateParams', '$location','$resource','Recipe'
  ($scope,$stateParams,$location,$resource,Recipe)->

    if $stateParams.keywords
      Recipe.query(keywords: $stateParams.keywords, (results)->
        $scope.recipes=results
      )
    else
      $scope.recipes = []
])