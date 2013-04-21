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
	        responses:  ['It is not always comfortable to tell people about your accomplishments. There are some ways, however, to make your achievements known to your colleagues in a proactive way. For example, you might want to meet briefly with your manager and/or sponsor to update him/her on the recent success of your project. If you ensure that your manager knows of your accomplishments, you can receive full credit for the work that you have done and feel more comfortable requesting different learning opportunities.','When you have done work that you are proud of, you should figure out a way to effectively make it known. During regular check-ins with your manager, make sure that discussion of your successes, however minor, are an agenda item. Continue to make your achievements known throughout the workplace more consistently.','Your ability to make others aware of your accomplishments is a proactive strategy to advance in the workplace. Be sure to continue seeking constructive feedback and credit as appropriate to ensure your candidacy for all possible promotions.'],
	        insightLink: 'http://www.catalyst.org/knowledge/myth-ideal-worker-does-doing-all-right-things-really-get-women-ahead',
	        insightText: 'Employees who make their professional accomplishments known throughout the workplace are more likely to experience compensation growth. This idea of seeking credit for work that you’ve done is a great way to not only make your accomplishments known, but also to be more satisfied with your career.'
	        },
	
	        // Q2
	        {
	        question:   'A sponsor is someone who has power in an organization. This person has the ability to help advance your career by giving you access to promotions or other leadership development opportunities. How often do you interact with your sponsor?',
	        answers:    ['Never - I don\'s have a sponsor', 'Rarely - I have a sponsor, but I\'m not sure what to discuss with him/her', 'Regularly - I check-in with my sponsor often and consult him/her for career advice'], 
	        responses:  ['If you don’t have a sponsor, identify someone in a senior level position with broad influence that will be able to guide you. Initiate contact with and ask for a brief meeting him/her. During this meeting, share your talents and goals with the sponsor, allowing him/her to know that you are worthy of their guidance. Maintain informal contact through quick e-mail update or requests for brief check-ins with this person after the meeting.','If you have minimal contact with your sponsor, make an effort to increase the number of quality interactions that you have. Per the first question, you should update your sponsor about your work achievements and seek feedback whenever necessary. If you are not sure about what you can gain from your sponsor, find out about what he/she has been up to and see how their background might align with your goals. ','If you’re fully maximizing interactions with your sponsor, continue to develop the relationship by bringing up other topics of discussion. Make the effort to get to know your sponsor’s professional goals as well. Seek broad industry insight and ask about advancement opportunities within the organization.'],
	        insightLink: 'http://www.catalyst.org/knowledge/mentoring-necessary-insufficient-advancement',
	        insightText: 'Having a sponsor, the behind-the-scenes support of a highly placed and influential person within the organization, is critical to advancement. Sponsors can provide guidance and help employees gain access to senior roles. If they understand your career goals and aspirations, they can also vouch for you in different scenarios and recommend you for different roles.'
        },
        
       

        // Q3
        {
        question:   'Informal networks are undefined networks that provide important information regarding the unspoken and unwritten rules of the company. These networks often comprise of informal relationships, such as friendship outside of work, collaboration on previous projects, or something as simple as desk proximity. Are you aware and a part of informal networks at your organization?',
        answers:    ['No – I was not aware that informal networks are important','Yes, I’m aware, but I don’t participate: ','Absolutely - I recognize that there are informal networks and I tap into them regularly'], 
        responses:  ['Building relationships both inside and outside the organization is important for networking as well as overall satisfaction. Consider your interests when looking for informal networks. Many organizations have activity-based groups such as sports leagues and book clubs. Informal chat during these interactions can often lead to valuable insight as to what’s going on in other departments and the organization in general.','Simply belonging to an organization might not be enough to separate yourself and gain visibility and recognition. It is also critical to find the most influential networks in the organization. Continue to develop relationships with individuals inside and outside the organization so that you can observe and learn from them.','You understand that hard work alone is not enough to be advance in the organization. Be sure that you are not only tapping into these networks but that you are adding value for others. Invite new hires and employees who are more introverted to after-work events. This also aids in growing your own informal network.'],
        insightLink: 'http://www.catalyst.org/knowledge/unwritten-rules-why-doing-good-job-might-not-be-enough',
        insightText: 'Catalyst research shows that lack of access to informal networks is one of the primary barriers to the advancement of women. When an organization’s rules and cultural norms are communicated through informal networks, those without access to these networks miss out on development opportunities.'

},

        // Q4
		{
		question:  'Not all roles are created equal. For some organizations, budget responsibility, profit and loss responsibility, and management of direct reports characterize mission-critical roles. Are you serving in a mission-critical role?',
		answers: 	['No – I have none of these responsibilities', 'Yes – I have some of these responsibilities', 'Yes – I have all of these responsibilities'],
		responses: 	['If you are in a position that doesn’t require these responsibilities, are there ways in which you can gain exposure to these tasks? You can volunteer for stretch opportunities that will allow you to learn more about how ta budget is managed and how you can manage future direct reports. Seek ways to be aware of the succession planning in your organization and see if there are ways that you can make your talents known.','Master the responsibilities that are essential to your role, allowing you to be a key resource to other employees who need that skill. Continue to seek learning and training opportunities to gain more insight about different aspects of leadership and management. ','Your ability to contribute to key aspects of projects makes you a valuable asset to your organization. In order to continue progressing, seek out the ways through which you can make your accomplishments know throughout the organization. Does your supervisor know how well you’re managing the budget? If you have direct reports, collect feedback from them often so you can constantly improve as a manager.'],
		insightLink:	'http://www.catalyst.org/knowledge/mentoring-necessary-insufficient-advancement',
		insightText:	'Consider the key mission of your organization and how your role contributes to that. Research shows that more men than women are access mission-critical roles, leading to a leadership gap in the workforce.'
		}
        
      ];
        

  var questionTemplateString = '\<div class="question-row" id="question<%= question_index %>"> \<%= question %><br><br>\<%  \_.each(answers, function(answer, answer_index) { \%> \<input type="radio" name="question<%= question_index %>" value="<%= answer_index %>">\<label for="<%= answer_index %>"><%= answer %></label><br>\<% }) %>\</div>';

  var resultTemplateString = '\<p><a href="<%= insightLink %>">Insight</a><br>\<%= insightText %><br>\ <%= response %><\p>';
	  
	  //var tableString = '<table border="1"><tr><td><div class="question-row" id="question<%= question_index %>"> \<%= question %><br><br>\<%  \_.each(answers, function(answer, answer_index) { \%> \<input type="radio" name="question<%= question_index %>" value="<%= answer_index %>">\<label for="<%= answer_index %>"><%= answer %></label><br>\<% }) %>\</div></td><td><p><a href="<%= insightLink %>">Insight</a><br>\<%= insightText %><br>\ <%= response %><\p></td></tr><tr><td>row 2, cell 1</td><td>row 2, cell 2</td></tr></table>';

	    
     //
      // DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU'RE DOING
      //

      // compile the templates into functions
      var questionTemplate = _.template(questionTemplateString+"<br>");
      var resultTemplate   = _.template(resultTemplateString+"<br>");


      // populate the quiz div with the questions
      //for (var i = 0; i < quiz.length; i++) {
      	var i = 0;
        var question = quiz[i].question;
        var answers = quiz[i].answers;
        
        $("#quiz1").append(questionTemplate({question_index: i, question: question, answers: answers}));
        i = 1;
        question = quiz[i].question;
        answers = quiz[i].answers;
        
        $("#quiz2").append(questionTemplate({question_index: i, question: question, answers: answers}));
        
        i = 2;
        question = quiz[i].question;
        answers = quiz[i].answers;
        
        $("#quiz3").append(questionTemplate({question_index: i, question: question, answers: answers}));
        
        i = 3;
        question = quiz[i].question;
        answers = quiz[i].answers;
        
        $("#quiz4").append(questionTemplate({question_index: i, question: question, answers: answers}));
      //}

    // attach event handlers to radio buttons
/*
      for (var i = 0; i < quiz.length; i++) {
        $('#question'+i).children('input').change(function() {
            console.log('boom');
        });
      }
      */

      // give life to the 'results' button
      $('input').change(function() {

        //var i;

        // reset the results div
        $("#results").html('');

        // check every answer
        //for (i = 0; i < quiz.length; i++) {
			var i = 0;
            // get the index of the question i selection (undefined if none)
            var answerIndex = $("input[name=question"+i+"]:checked").val();

            // only add the response to the results if something is selected
            if (typeof answerIndex !== "undefined") {
                var response    = quiz[i].responses[answerIndex];
                var insightText = quiz[i].insightText;
                var insightLink = quiz[i].insightLink;
$("#results1").empty();
                $("#results1").append(resultTemplate({
                    response    : response, 
                    insightText : insightText, 
                    insightLink : insightLink 
                }));
        }
        	i = 1;
            // get the index of the question i selection (undefined if none)
            answerIndex = $("input[name=question"+i+"]:checked").val();

            // only add the response to the results if something is selected
            if (typeof answerIndex !== "undefined") {
                response    = quiz[i].responses[answerIndex];
                insightText = quiz[i].insightText;
                insightLink = quiz[i].insightLink;
$("#results2").empty();
                $("#results2").append(resultTemplate({
                    response    : response, 
                    insightText : insightText, 
                    insightLink : insightLink 
                }));
        }
        i = 2;
            // get the index of the question i selection (undefined if none)
            answerIndex = $("input[name=question"+i+"]:checked").val();

            // only add the response to the results if something is selected
            if (typeof answerIndex !== "undefined") {
                response    = quiz[i].responses[answerIndex];
                insightText = quiz[i].insightText;
                insightLink = quiz[i].insightLink;
				$("#results3").empty();
                $("#results3").append(resultTemplate({
                    response    : response, 
                    insightText : insightText, 
                    insightLink : insightLink 
                }));
        }
       i = 3;
            // get the index of the question i selection (undefined if none)
            answerIndex = $("input[name=question"+i+"]:checked").val();

            // only add the response to the results if something is selected
            if (typeof answerIndex !== "undefined") {
                response    = quiz[i].responses[answerIndex];
                insightText = quiz[i].insightText;
                insightLink = quiz[i].insightLink;
$("#results4").empty();
                $("#results4").append(resultTemplate({
                    response    : response, 
                    insightText : insightText, 
                    insightLink : insightLink 
                }));
        }
      });
