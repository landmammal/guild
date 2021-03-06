# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).on 'turbolinks:load', ->
  window.jobsFormPage = $('#jobs.new, #jobs.edit')[0]?
  if window.jobsFormPage
    console.log('Binding Listeners')
    descriptionToggle() if window.jobsFormPage



descriptionToggle = ->
  $linkGroup = $('#link_group')
  $linkRadio = $('#description_link')
  $descriptionGroup = $('#description_group')
  $descriptionRadio = $('#description_description')

  $descriptionRadio.on 'change', (e) ->
    if this.checked
      $linkGroup.fadeOut 'fast', ->
        $descriptionGroup.fadeIn()

  $linkRadio.on 'change', (e) ->
    if this.checked
      $descriptionGroup.fadeOut 'fast', ->
        $linkGroup.fadeIn()

  $(document).on 'turbolinks:request-start', ->
    console.log('Unbinding Listeners')
    $descriptionRadio.off 'change'
    $linkRadio.off 'change'
    $(document).off 'turbolinks:request-start', ->
