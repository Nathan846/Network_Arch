HIGH-LEVEL APPROACH
Our high level approach when starting CP2 was to identify key design choices and their trade-offs before committing to any implementation. We would then explore our different
ideas and eliminate choices based on testing, complexity, and future adaptability. We would repeat this process whenever making a key decision. When a consensus was reached,
we would each implement the design independently and then compare our solutions, utilizing whichever ideas seemed to work better, mixing and matching as we progress. Eventually
this approach led us to a single final version which utilized both implementations and multiple previous versions. 

PROCESS
For CP2 of project 3, we started by reading the project specifications in depth; highlighting and color-coding important details for our implementation. This process 
delayed initial progress but ensured our understanding of certain design requirements that would end up being crucial in our implementation. We then looked at the base code,
with the goal of completely understanding the base before editing anything else. Our approach was to slowly add functionality to the base code, handling each unique case
individually and one at a time. Our first major design decision was what kind of ACKs our receiver was going to use: Individual, Cumulative, or Full Information. Initially, 
we had decided on using cumulative ACKs, and began writing a "send_ack" function within the receiver that would use a dictionary to check if the most recent expected ACK had 
been received (Entry in the dictionary that corresponds with "sequence" is None or not and sends ACK accordingly). However, we eventually realized that for the purpose of this 
project individual ACKs would be adequate and would simplify our implementation for the receiver. We determined that because we are able to store the ACKs/Packets we have 
received and sent in python lists or dictionaries, the added complexity of cumulative ACKs wouldn't improve performance. After this point, we began modifying the receiver so it 
can recognize the 'EOF' packet and exit upon its arrival. We also modified how and when our recieved packets would be sent to STDOUT, saving each packet in a dictionary and then
only printing once all packets have been received ('EOF' has arrived). We created a separate function called, "print_packets_in_order()" to handle this case. These modifications
handled most tests that deal with duplicate packets, delay, and reordering. We then moved on the sender where we identified multiple unique edge cases that would need to be handled, 
specifically what to do if an out of order (Unexpected according to SEQUENCE number) ACK is received, when to retransmit previously sent packets, and how to handle timeouts. All of 
these cases were handled by a "retransmit()" function and its placement in our main while loop. The function will check a dictionary that contains packets that have been sent but 
haven't yet received a corresponding ACK, it will then check if the packet has also reached its timeout and if it has, it resends the packet. This worked initially but after some 
testing using netsim we found that our program can get stuck retransmitting packets that it actually doesn't need to. At this point, we focused on fixing our sender and didn't add any
additional functions. Eventually, we realized our sender was getting stuck on our initial call to sock.recvfrom. This problem halted our progress for some time, until we found 
resources online (StackOverflow, GeeksForGeeks, Pythontic, etc) which showed how we can use the select.select() function to prevent our socket from blocking. After this change, we 
continued adding to our sender, improving our retransmit function by creating a MAX_RETRANSMIT function that would prevent unnecessary resending of packets. With all these changes, 
we were able to pass all advanced tests and all but one basic test. Our current implementation returns the correct data in the performance tests but is too slow and therefore fails
these tests due to rate of transfer. We're certain we can use multithreading to remedy this problem, but our initial exploration into this idea caused us to fail tests we were 
previously passing. Due to the time constraint, we had to forego these improvements in CP2. 