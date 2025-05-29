resource "aws_key_pair" "main" {
  key_name   = var.key_name
  public_key = var.public_key
}

resource "aws_instance" "vm" {
  count         = var.vm_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name      = aws_key_pair.main.key_name

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = "${var.name}-${count.index + 1}"
    ProjectName = var.project_name
  }
}
