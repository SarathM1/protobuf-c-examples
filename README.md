# Build
use 'make' to build the code

# Running the code
Test by piping one program into the next at command line:

./amessage_serialize 10 2 | ./amessage_deserialize 
Writing: 4 serialized bytes
Received: a=10 b=2