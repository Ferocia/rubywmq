#
# Sample : each() : Retrieve all messages from a queue
#          If no messages are on the queue, the program
#          completes without waiting
#
require 'wmq'

WMQ::QueueManager.connect(q_mgr_name: 'REID') do |qmgr|
  qmgr.open_queue(q_name: 'TEST.QUEUE', mode: :input) do |queue|
    queue.each do |message|
      puts "Data Received: #{message.data}"
    end
  end
  puts 'Completed.'
end
