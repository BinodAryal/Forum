package com.Forum

import grails.plugin.springsecurity.annotation.Secured

class ForumController {
    def springSecurityService
    @Secured(['ROLE_USER'])
    def postReply(long threadId, String body) {
        def offset = params.offset
        if (body != null && body.trim().length() > 0) {
            DiscussionThread thread = DiscussionThread.get(threadId)
            def commentBy = springSecurityService.currentUser
            new Comment(thread:thread, commentBy:commentBy, body:body).save()
            // go to last page so user can view his comment
            def numberOfComments = Comment.countByThread(thread)
            def lastPageCount = numberOfComments % 10 == 0 ? 10 : numberOfComments % 10
            offset = numberOfComments - lastPageCount
        }
        redirect(action:'thread', params:[threadId:threadId, offset:offset])
    }
}