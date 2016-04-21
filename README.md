# Thirft Workshop

This repo contains example code for creating thrift/clients and
servers using various tools. There is a simple thrift protocol
designed for use with multiple clients. There is one RPC to increment
a counter and another RPC to retrive the current value.
`docker-compose` is used to create all the containers for this
exercise. The workshop is divided into two sections:

1. Using the official Thrift library to create the client and server.
	 Then booting the app with `docker-compose`.
2. Updating the code to use the third party tools to write the client
	 and server.
