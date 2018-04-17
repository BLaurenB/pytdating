
$(document).ready(function(){
    "use strict";
let traitHash


    $("#ex13").slider({
        ticks: [0, 100, 200, 300, 400],
        ticks_labels: ['$0', '$100', '$200', '$300', '$400'],
        ticks_snap_bounds: 30
    });


    $('#pool-button').click(function(){
        $('.show-the-daters-backers').toggleClass('show-the-daters-backersAdd')
    })


    $('#show-match-preferences').click(function(){
      $('.match-preferences').toggleClass('match-preferences-show')
  })

    $('#dater-q1-button').click(function(){
      event.preventDefault()
        $('.answer1-table').toggleClass('answer1-table-show')
    })

    $('#dater-q2-button').click(function(){
      event.preventDefault()
        $('.answer2-table').toggleClass('answer1-table-show')
    })

    $('#dater-q3-button').click(function(){
      event.preventDefault()
        $('.answer3-table').toggleClass('answer1-table-show')
    })
    $('#dater-q4-button').click(function(){
      event.preventDefault()
        $('.answer4-table').toggleClass('answer1-table-show')
    })
    $('#dater-q5-button').click(function(){
      event.preventDefault()
        $('.answer5-table').toggleClass('answer1-table-show')
    })

    $('#card-button').click(function(){
        $('.list-and-add-backers').toggleClass('backer-search-form')
    })

    $('#edit-about-button').click(function(){
        event.preventDefault()
        $('.about-you').toggleClass('edit-profile-show')
    })



    //flash message if pool is empty from erb template
    $("#pool-is-empty").delay( 6000 ).fadeOut( 300 )



// DATER SEARCHES FOR BACKER BY EMAIL
    $('#find-backer-by-email').click(function(event) {
      event.preventDefault()
      let email = event.target.offsetParent.childNodes[1].value
      let currentUser = document.location.pathname.substr(11)

      fetch(`http://pytdating-live.herokuapp.com/api/v1/users?email=${email}`)
      .then((response) => response.json())
      .then((parsed) => {
        console.log(parsed)
        if (parsed === null) {
          $("#your-backers").append(
            `<div class="alert alert-warning" role="alert" id="backer-not-found-alert">
              <h4 class="alert-heading">Oh Snap!</h4>
                <p>That person isn't signed up. Send them an invite!</p>
             </div>`)
          $("#backer-not-found-alert").delay( 3000 ).fadeOut( 300 )
        }
        else {
          let backerId = parsed.id
          let currentUser = document.location.pathname.substr(11)
          fetch(`http://pytdating-live.herokuapp.com/api/v1/daters/${currentUser}/backers/${backerId}`)
          .catch(error => console.error(error))

          $("#your-backers").append(
             `<div class="alert alert-success" role="alert" id="backer-invited-alert">
                <h4 class="alert-heading">${parsed.f_name} ${parsed.l_name} was added as a backer!</h4>
              </div>`)
          $("#backer-invited-alert").delay( 1500 ).fadeOut( 300 )
        }
      })
      .catch(error => console.error(error) )
      }
    )



// BACKER SEARCHES FOR DATER BY EMAIL
    $('#find-dater-by-email').click(function(event) {
      event.preventDefault()
      let email = event.target.offsetParent.childNodes[1].value
      let currentUser = document.location.pathname.substr(11)

      fetch(`http://pytdating-live.herokuapp.com/api/v1/users?email=${email}`)
      .then((response) => response.json())
      .then((parsed) => {
        console.log(parsed)
        if (parsed === null) {
          $(".search-for-new-dater").append(
            `<div class="alert alert-warning" role="alert" id="dater-not-found-alert">
              <h4 class="alert-heading">Oh Snap!</h4>
                <p>That person isn't signed up. Send them an invite!</p>
             </div>`)
          $("#dater-not-found-alert").delay( 3000 ).fadeOut( 300 )
        }
        else {
          //if they ARE in the db, send an invite.
          let daterId = parsed.id
          let currentUser = document.location.pathname.substr(11)

          $(".search-for-new-dater").append(
             `<div class="alert alert-success" role="alert" id="dater-invited-alert">
                <h4 class="alert-heading">${parsed.f_name} ${parsed.l_name} isn't part of your Tribe yet!</h4>
                <a class ="primary-btn card-button" id="invite-dater-button" data-id="${email}"> "Ask ${parsed.f_name}" to back you! </a>
              </div>`)
          $("#dater-invited-alert").delay( 10000 ).fadeOut( 300 )
        }
      })
      .catch(error => console.error(error) )
      }
    )

//SEND EMAIL TO INVITE NEW DATER - not complete yet. need email functionality
    $(".search-for-new-dater").on("click", "#invite-dater-button", function(event) {
      event.preventDefault()
      let email = event.target.offsetParent.childNodes[1].value
      console.log(email)
      $('.form-control').html('')
      $.get(`http://pytdating-live.herokuapp.com/invites?email=${email}`)
    })


// BACKER SEARCHES FOR DATER BY NAME
    $('#find-dater-by-name').click(function(event) {
      event.preventDefault()
      let first = event.target.offsetParent.childNodes[1].value
      let last =  event.target.offsetParent.childNodes[3].value
      let currentUser = document.location.pathname.substr(11)
      console.log(first, last, currentUser)

            fetch(`http://pytdating-live.herokuapp.com/api/v1/users?f_name=${first}&l_name=${last}`)
            .then((response) => response.json())
            .then((parsedDaters) => {
              console.log(parsedDaters)
              if (parsedDaters.length === 0) {
                // CAN'T FIND BY FIRST AND LAST NAME
                $(".search-for-new-dater").append(
                  `<div class="alert alert-warning" role="alert" id="dater-not-found-alert">
                    <h4 class="alert-heading">Oh Snap!</h4>
                      <p>That person isn't signed up. Send them an invite!</p>
                   </div>`)
                $("#dater-not-found-alert").delay( 3000 ).fadeOut( 300 )
              }

              else {
                //FOUND AT LEAST ONE PERSON BY THAT NAME. PRESENT NAME AND IMAGES FOR USER TO SELECT.
                $(".search-for-new-dater").append(
                   `<div class="alert alert-success" role="alert" id="dater-invited-alert">
                      <h4 class="alert-heading"> Which ${first.toUpperCase()} ${last.toUpperCase()} is your Framily Member?</h4>
                    </div>`)
                $("#dater-invited-alert").delay( 2000 ).fadeOut( 300 )
                parsedDaters.forEach(function(dater) {

                $(".search-for-new-dater").append(`
                  <div class="card" style="width: 18rem;">
                    <img class="card-img-top" src="..." alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">${dater.f_name} ${dater.l_name}</h5>
                      <p class="card-text">...</p>
                      <a class ="primary-btn card-button" id="connect-user-as-dater" data-text="${dater.id}" >Connect with Me!</a>
                    </div>
                  </div>
                `)
                })
              }
            })
            .catch(error => console.error(error))
    })

// BACKER ADDS NEW DATER IN-APP - INCLUDES PERMISSION
    $('.search-for-new-dater').on("click", '#connect-user-as-dater', function(event) {
      event.preventDefault()
      let daterId = event.currentTarget.attributes[2].nodeValue
      let currentUser = document.location.pathname.substr(11)
      fetch(`http://pytdating-live.herokuapp.com/api/v1/backers/${currentUser}/daters/${daterId}`)
      .catch(error => console.error(error))

        $(".search-for-new-dater").append(`
          <div class="alert alert-success" role="alert" id="dater-invited-alert">
            <h4 class="alert-heading"> Dater Added!</h4>
          </div>`).delay( 1500 ).fadeOut( 300 )
      })

////////////////////////////////////////////

    // SEND EMAIL TO INVITE A DATER
    $(".list-and-add-backers").on("click", "#invite-dater-button", function(event) {
      event.preventDefault()
      let email = event.target.offsetParent.childNodes[1].value
      console.log(email)
      $.get(`http://pytdating-live.herokuapp.com/invites?email=${email}&add_dater=true`)
        $(".list-and-add-backers").append(`
          <div class="alert alert-success" role="alert" id="dater-invited-alert">
            <h4 class="alert-heading"> Email Sent!</h4>
            `).delay( 1500 ).fadeOut( 300 )
    })


    ///////////////////////////////////////


    $('#answer-questions').click(function(){
        event.preventDefault()
        $('.layer').css('display',"block")
        $('.q_1_modal').css('display',"block")
    })

    $('#edit-profile-button').click(function(){
        event.preventDefault()
        $('.edit-traits').css('display','none')
        $('.edit-mate-preference-show').css('display','none')

        $('.edit-profile').removeClass('edit-mate-preference-show')
        $('.edit-profile').toggleClass('edit-profile-show')
    })

    $('#edit-mate-button').click(function(){
        event.preventDefault()
        $('.edit-traits').css('display','none')
        $('.edit-profile').removeClass('edit-profile-show')
        $('.edit-mate-preference').toggleClass('edit-mate-preference-show')
    })

    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('whatever') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('.modal-title').text('New message to ' + recipient)
        modal.find('.modal-body input').val(recipient)
      })



	var window_width 	 = $(window).width(),
	window_height 		 = window.innerHeight,
	header_height 		 = $(".default-header").height(),
	header_height_static = $(".site-header.static").outerHeight(),
	fitscreen 			 = window_height - header_height;


	$(".fullscreen").css("height", window_height)
	$(".fitscreen").css("height", fitscreen);


     // -------   Active Mobile Menu-----//

    $(".menu-bar").on('click', function(e){
        e.preventDefault();
        $("nav").toggleClass('hide');
        $("span", this).toggleClass("lnr-menu lnr-cross");
        $(".main-menu").addClass('mobile-menu');
    });

    // $('select').niceSelect();
    $('.img-pop-up').magnificPopup({
        type: 'image',
        gallery:{
        enabled:true
        }
    });


    $('.active-exprience-carousel').owlCarousel({
        center: true,
        items:1,
        loop:true
    })
    $('.next-trigger').click(function() {
        $(".active-exprience-carousel").trigger('next.owl.carousel');
    })
        // Go to the previous item
    $('.prev-trigger').click(function() {
        $(".active-exprience-carousel").trigger('prev.owl.carousel');
    });
    $('.play-btn').magnificPopup({
        type: 'iframe',
        mainClass: 'mfp-fade',
        removalDelay: 160,
        preloader: false,
        fixedContentPos: false
    });
    $(document).ready(function() {
        $('#mc_embed_signup').find('form').ajaxChimp();
    });
    // -------   Mail Send ajax

     $(document).ready(function() {
        var form = $('#myForm'); // contact form
        var submit = $('.submit-btn'); // submit button
        var alert = $('.alert-msg'); // alert div for show alert message

        // form submit event
        form.on('submit', function(e) {
            e.preventDefault(); // prevent default form submit

            $.ajax({
                url: 'mail.php', // form action url
                type: 'POST', // form submit method get/post
                dataType: 'html', // request type html/json/xml
                data: form.serialize(), // serialize form data
                beforeSend: function() {
                    alert.fadeOut();
                    submit.html('Sending....'); // change submit button text
                },
                success: function(data) {
                    alert.html(data).fadeIn(); // fade in response data
                    form.trigger('reset'); // reset form
                    submit.attr("style", "display: none !important");; // reset submit button text
                },
                error: function(e) {
                    console.log(e)
                }
            });
        });
    });




 });
