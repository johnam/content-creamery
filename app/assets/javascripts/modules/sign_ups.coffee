$ ->
  $('#New-Sign-Up').each ->
    signUpDemographics = $('#Sign-Up__Demographics')

    $(this).submit (e) ->
      e.preventDefault()

      $.ajax
        type: "POST"
        url: $(this).attr('action')
        dataType: 'json'
        data: $(this).serialize()
        error: (data, textStatus, errorThrown) ->
          errors = data.responseJSON.errors

          if Array.isArray(errors)
            errors = errors.join(' / ')

          $('.sign-up__card-error').text(errors);
        success: (data, textStatus, jqXHR) ->
          $('#Update-Sign-Up-ID').val(data.email)
          $('#Sign-Up__Email').fadeOut () ->
            signUpDemographics.show()
          ga('send', 'event', '_trackEvent', 'newsletter', 'sign-up', 'homepage')

    $('#Update-Sign-Up').submit (e) ->
      e.preventDefault()

      $.ajax
        type: "PUT"
        url: $(this).attr('action')
        dataType: 'json'
        data: $(this).serialize()
        error: (data, textStatus, errorThrown) ->
        success: (data, textStatus, jqXHR) ->
          ga('send', 'event', '_trackEvent', 'newsletter', 'demographics', 'homepage')

          $('#Sign-Up__Demographics-Content').fadeOut () ->
            $(this).remove()
            signUpDemographics.css('min-height', '0px')
            $('#Sign-Up').fadeOut(1000)