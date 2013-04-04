var Answer = {
  init:function(){
    $('form#new_answer').on('ajax:success', this.appendAnswer );
  },

  appendAnswer: function(e, data){
    // debugger
    $('h3#answer-list').append(data.answer.content)
  }
}

$(document).ready(function(){
  Answer.init();
})
