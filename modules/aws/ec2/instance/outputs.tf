output "instance_id" {
    description = "ID of EC2 Instance"
    value       = aws_instance.instance.id
}