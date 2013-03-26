    <script type="text/template" id="question-row-template">
      <div class="question-row" id="question<%= question_index %>">
        <h2><%= question %></h2>
        <% 
          _.each(answers, function(answer, answer_index) { 
        %> 
        <input type="radio" name="question<%= question_index %>" value="<%= answer_index %>">
        <label for="<%= answer_index %>"><%= answer %></label>
        <% }) %>
      </div>
    </script>

    <!--  
      this is the template for one row of 'results'
    -->
    <script type="text/template" id="results-row-template">
      <h2><em> <%= question %> </em> - <%= answer %></h2>
      <p> <%= response %>
    </script>

    <script>
      //
      // EDIT HERE!!!
      //
      // this is where you put your quiz questions!
      //
      // follow this format, add as many questions as you want
      //

      var quiz = [
        // Q1
        {
        question:   'How comfortable are you with making your achievements known in the workplace?',
        answers:    ['Not Comfortable', 'Somewhat Comfortable', 'Very Comfortable'], 
        responses:  ['It is not always comfortable to tell people about your accomplishments. There are some ways, however, to make your achievements known to your colleagues in a proactive way. For example, you might want to meet briefly with your manager and/or sponsor to update him/her on the recent success of your project. If you ensure that your manager knows of your accomplishments, you can receive full credit for the work that you have done and feel more comfortable requesting different learning opportunities. ','When you have done work that you are proud of, you should figure out a way to effectively make it known. During regular check-ins with your manager, make sure that discussion of your successes, however minor, are an agenda item. Continue to make your achievements known throughout the workplace more consistently.','Your ability to make others aware of your accomplishments is a proactive strategy to advance in the workplace. Be sure to continue seeking constructive feedback and credit as appropriate to ensure your candidacy for all possible promotions. ']
        },

        // Q2
        {
        question:   'How often do you interact with your sponsor?',
        answers:    ['Never - I don\'s have a sponsor', 'Rarely - I have a sponsor, but I\'m not sure what to discuss with him/her', 'Regularly - I check-in with my sponsor often and consult him/her for career advice'], 
        responses:  ['If you donnot have a sponsor, identify someone in a senior level position with broad influence who will be able to guide you. Initiate contact with and ask for a brief meeting him/her. During this meeting, share your talents and goals with the sponsor, allowing him/her to know that you are worthy of their guidance. Maintain informal contact through quick e-mail update or requests for brief check-ins with this person after the meeting.','If you have minimal contact with your sponsor, make an effort to increase the number of quality interactions that you have. Per the first question, you should update your sponsor about your work achievements and seek feedback whenever necessary. If you are not sure about what you can gain from your sponsor, find out about what he/she has been up to and see how their background might align with your goals. ','If you are fully maximizing interactions with your sponsor, continue to develop the relationship by bringing up other topics of discussion. Make the effort to get to know your sponsor\' professional goals as well. Seek broad industry insight and ask about advancement opportunities within the organization.   ']
        },

        // Q3
        {
        question:   'How many times have you changed jobs?',
        answers:    ['>=2','1 time','Never'], 
        responses:  ['While having multiple jobs can be beneficial in terms of diversifying your professional experiences, it is not helpful in closing compensation differences between men and women.','There is no difference in compensation growth between female Leavers and Stayers. Before considering leaving an organization, seek different internal roles and opportunities. Even when you cannot transition into a new role immediately, make sure that you are maximizing the learning opportunities of your current role. Master your key responsibilities and then seek variety in the assignments that are given to you.','Stayers have the highest earning potential within an organization. When considering leaving one organization for another, consider the potential benefits of joining a new organization. Ensure that your offer package meets your desired compensation, benefits, and growth potential. ']

}

        // add more below if you'd like...
        
      ];


      //
      // DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU'RE DOING
      //

      // compile the templates into functions
      var questionTemplate = _.template($("#question-row-template").html());
      var resultTemplate   = _.template($("#results-row-template").html());


      // populate the quiz div with the questions
      for (var i = 0; i < quiz.length; i++) {
        var question = quiz[i].question;
        var answers = quiz[i].answers;
        $("#quiz").append(questionTemplate({question_index: i, question: question, answers: answers}));
      }

      // give life to the 'results' button
      $('#submit-quiz').click(function() {

        // make sure all questions are answered -- optional?
        for (var i = 0; i < quiz.length; i++) {
          var answerIndex = $("input[name=question"+i+"]:checked").val();
          if (typeof answerIndex === "undefined") {
            $("#results").html('<h4><em>please answer question ' +(i+1)+ '!</em><h4>');
            return;
          }
        }

        // fill in the results div
        $("#results").html('');
        for (var i = 0; i < quiz.length; i++) {
          var answerIndex = $("input[name=question"+i+"]:checked").val();
          var question    = quiz[i].question;
          var answer      = quiz[i].answers[answerIndex];
          var response    = quiz[i].responses[answerIndex];

          $("#results").append(resultTemplate({question: question, answer: answer, response: response}));
        }
      });

    </script>