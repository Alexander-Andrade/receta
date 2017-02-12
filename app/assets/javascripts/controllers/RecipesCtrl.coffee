controllers = angular.module('controllers')
controllers.controller("RecipesCtrl", [ '$scope', '$stateParams', '$location','$resource','Recipe'
  ($scope,$stateParams,$location,$resource,Recipe)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $stateParams.keywords
      Recipe.query(keywords: $stateParams.keywords, (results)->
        $scope.recipes=results
      )
    else
      $scope.recipes = []

#    $scope.view = (recipeId)-> $location.path("/recipes/#{recipeId}")
])