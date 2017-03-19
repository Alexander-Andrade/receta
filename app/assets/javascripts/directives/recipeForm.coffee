angular.module('directives')
  .directive 'recipeForm', ->
    {
      templateUrl: 'recipes/_form.html'
      scope:
        recipe: '='
        save: '&'
    }
