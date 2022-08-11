#AWS ELB Configuration
resource "aws_elb" "alter-elb" {
  name            = "alter-elb"
  subnets         = [aws_subnet.Python_Task.id]
  security_groups = [aws_security_group.alter-elb-securitygroup.id]
  
  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "alter-elb"
  }
}
