<%@ page import="com.Forum.DiscussionThread" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Grails Forum</title>
	</head>
	<body>
        <div class="pagination">
            <g:paginate total="${numberOfThreads}" params="${[topicId:topic.id]}"/>
        </div>

        <div class="section">
            <div class="sectionTitle">
                ${topic.title}
                <span class="topicDesc">${topic.description}</span>
            </div>
            <g:each in="${threads}" var="thread">
                <div class="topic">
                    <g:link controller="forum" action="thread" params="[threadId:thread.id]" >
                        ${thread.subject}
                    </g:link>
                    <div class="rightInfo">
                        <b>replies</b>: ${thread.numberOfReplies}
                    </div>
                    <div>
                        Started by: ${thread.opener.username}
                        on: <g:formatDate date="${thread.createDate}" format="dd MMM yyyy"/>
                    </div>
                </div>
            </g:each>
        </div>

        <div class="pagination">
            <g:paginate total="${numberOfThreads}" params="${[topicId:topic.id]}"/>
        </div>
	</body>
</html>
