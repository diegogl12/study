# Load Balancer

## What is it?

It's a second type of the load balancer introduced in the second part of the Elastic Load Balancer service.<br>
#### Reasons to use
- It has the hability to use containers to host your micrservices.

### Key Terms
- Listeners: A process that check for connection requests;
- Target: Destination for traffic based on the established listener rules;
- Target Group: Each target group routes requests to one or more registered target.


## Starting

- Go to the EC2 console;
-  Look to the side navigation pane, and click on -> Load Balancer;
- Click 'Create Load Balancer';
- Check the Load Balancer type;
- Name it, define the IP adress type. In the field VPC, choose the VPC of your Availability Zones, with your servers;
- You can tag it: KEY : VALUE (Name:Application Load Balancer);
- Next page you configure the security group;
- Next page you configure the routing. The roules for your backend destination;
- Next page you can define the target Server;
- Then just click create.
