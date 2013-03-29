class Emailer < ActionMailer::Base
  default from: "from@example.com"

	def comment_added(post, comment)
    @post = post
		@comment = comment
    @url  = 'http://example.com/'
    mail(to: post.email, subject: 'A new comment added')
  end
end
