class NewCommentJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    # Somewhere in your app this is called, perhaps
    # from a NewCommentJob.
    ActionCable.server.broadcast(
      "chat_#{room}",
      {
        sent_by: 'Paul',
        body: 'This is a cool chat app.'
      }
    )

  end
end
