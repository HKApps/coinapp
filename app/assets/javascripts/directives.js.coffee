coinappDirectives = angular.module('coinappDirectives', [])

# coinappDirectives.directive 'phone', ->
#   restrict: "A"
#   require: "ngModel"
#   link: (scope, element, attrs, ctrl) ->
#     angular.element(element).bind "blur", ->
#       value = @value
#       phone_regexp = /^[(]{0,1}[0-9]{3}[)\.\- ]{0,1}[0-9]{3}[\.\- ]{0,1}[0-9]{4}$/
#       # Valid input
#       if phone_regexp.test(value)
#         angular.element(this).parent().parent()
#           .removeClass('has-error')
#           .addClass('has-success')
#       # Invalid input
#       else
#         angular.element(this).parent().parent()
#           .removeClass('has-success')
#           .addClass('has-error')
#       return
#     return
