services = angular.module('services')
services.factory('Recipe', ['$resource', ($resource)->
  return $resource('/recipes/:recipeId', {recipeId: '@id', format: 'json'})
])