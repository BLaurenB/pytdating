$(document).ready(function(){


const postComment = (bod,backer,dater) => {  
    return fetch(`http://localhost:3000/backers/${backer}/daters/${dater}/comments`, {
        body: JSON.stringify(bod), // must match 'Content-Type' header
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, same-origin, *omit
        headers: {
          'content-type': 'application/json'
        },
        method: 'POST', // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, cors, *same-origin
        redirect: 'follow', // *manual, follow, error
        referrer: 'no-referrer', // *client, no-referrer
      })
      .then(response =>  response.json())
   } 
$('#q-button-start').click(function(){
    $('.layer').fadeIn(1000)
    $('.comment-box').fadeIn(2000)
})

$('.exit').click(function(){
  $('.layer').fadeOut(1000)
  $('.comment-box').fadeOut(1000)

})


$('#q1-comment-submit').click(function(){
  let q1= $('#q1_id_hidden').val()
  let ans1= $('#q1-comment-answer').val()
  let backer= $('#backer_id_hidden').val()
  let dater= $('#dater_id_hidden').val()
  console.log($('#q1-comment-box'))
  $('#q1-comment-box').slideUp(1000)
  let body = {
    'ans' : ans1,
    'q': q1
  }
  $('#q2-comment-box').slideDown(2000)
  postComment(body,backer,dater)
})

$('#q2-comment-submit').click(function(){
    let q2= $('#q2_id_hidden').val()
    let ans2= $('#q2-comment-answer').val()
    let backer= $('#backer_id_hidden').val()
    let dater= $('#dater_id_hidden').val()
    $('#q2-comment-box').slideUp(1000)
    let body = {
        'ans' : ans2,
        'q': q2
    }
    $('#q3-comment-box').slideDown(2000)
    postComment(body,backer,dater)
  })

  $('#q3-comment-submit').click(function(){
    let q3= $('#q3_id_hidden').val()
    let ans3= $('#q3-comment-answer').val()
    let backer= $('#backer_id_hidden').val()
    let dater= $('#dater_id_hidden').val()
    $('#q3-comment-box').slideUp(1000)
    let body = {
        'ans' : ans3,
        'q': q3
    }
    $('#q4-comment-box').slideDown(2000)
    postComment(body,backer,dater)
  })


  $('#q4-comment-submit').click(function(){
    let q4= $('#q4_id_hidden').val()
    let ans3= $('#q4-comment-answer').val()
    let backer= $('#backer_id_hidden').val()
    let dater= $('#dater_id_hidden').val()
    $('#q4-comment-box').slideUp(1000)
    let body = {
        'ans' : ans3,
        'q': q4
    }
    $('#q5-comment-box').slideDown(3000)
    postComment(body,backer,dater)
  })

  $('#q5-comment-submit').click(function(){
    let q5= $('#q5_id_hidden').val()
    let ans3= $('#q5-comment-answer').val()
    let backer= $('#backer_id_hidden').val()
    let dater= $('#dater_id_hidden').val()
    $('#q5-comment-box').slideUp(1000)
    let body = {
        'ans' : ans3,
        'q': q5
    }
    $('#p1-comment-box').slideDown(3000)
    postComment(body,backer,dater)
  })
  
  $('#p1-submit').click(function(){
    let p1= $('#p1_id_hidden').val()
    let p1_value= $('#p1-value').val()
    let p2= $('#p2_id_hidden').val()
    let p2_value= $('#p2-value').val()
    let p3= $('#p3_id_hidden').val()
    let p3_value= $('#p3-value').val()
    let p4= $('#p4_id_hidden').val()
    let p4_value= $('#p4-value').val()
    let p5= $('#p5_id_hidden').val()
    let p5_value= $('#p5-value').val()
    let backer= $('#backer_id_hidden').val()
    let dater= $('#dater_id_hidden').val()
    $('#p1-comment-box').slideUp(1000)
    let body = {
      'val1' : p1_value, p2_value, p3_value, p4_value, p5_value,
      'p': p1, p2, p3, p4, p5
    }
    postComment(body,backer,dater)
    $('#p2-comment-box').slideDown(3000)
  })

  $('#p2-submit').click(function(){
    let p6= $('#p6_id_hidden').val()
    let p6_value= $('#p6-value').val()
    let p7= $('#p7_id_hidden').val()
    let p7_value= $('#p7-value').val()
    let p8= $('#p8_id_hidden').val()
    let p8_value= $('#p8-value').val()
    let p9= $('#p9_id_hidden').val()
    let p9_value= $('#p9-value').val()
    let p10 = $('#p10_id_hidden').val()
    let p10_value= $('#p10-value').val()
    let backer= $('#backer_id_hidden').val()
    let dater= $('#dater_id_hidden').val()
    $('#p2-comment-box').slideUp(1000)
    let body = {
      'val2' : p6_value, p7_value, p8_value, p9_value, p10_value,
      'p_6': p6, p7, p8, p9, p10
    }
    $('#p3-comment-box').slideDown(3000)
    postComment(body,backer,dater)
  })

  $('#p3-submit').click(function(){
    let p11= $('#p11_id_hidden').val()
    let p11_value= $('#p11-value').val()
    let p12= $('#p12_id_hidden').val()
    let p12_value= $('#p12-value').val()
    let p13= $('#p13_id_hidden').val()
    let p13_value= $('#p13-value').val()
    let p14= $('#p14_id_hidden').val()
    let p14_value= $('#p14-value').val()
    let p15 = $('#p15_id_hidden').val()
    let p15_value= $('#p15-value').val()
    let backer= $('#backer_id_hidden').val()
    let dater= $('#dater_id_hidden').val()
    $('#p3-comment-box').slideUp(1000)
    let body = {
      'val3' : p11_value, p12_value, p13_value, p14_value, p15_value,
      'p_11': p11, p12, p13, p14, p15
    }
    $('#question-end').slideDown(3000)
    postComment(body,backer,dater)
  })
})