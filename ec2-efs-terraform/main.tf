resource "aws_instance" "instance" {
  ami             = "${var.ami}"
  instance_type   = "${var.instance_type}"
  subnet_id       = "${var.subnet}"
  key_name        = "${var.key}"
  user_data       = var.enable_efs ? templatefile("efs_mount.tftpl", { efs_dns = "${aws_efs_file_system.efs[0].id}.efs.${var.region}.amazonaws.com", mount_dir = "${var.mount_dir}" }) : ""
  security_groups = "${var.security_groups}"
  tags = {
    Name      = "${var.instance_name}"
  }
}

resource "aws_efs_file_system" "efs" {
  count = var.enable_efs ? 1 : 0
  creation_token   = "${var.fs_name}"
  performance_mode = "${var.fs_perf_mode}"
  tags = {
    Name = "${var.fs_name}"
  }
}

resource "aws_efs_mount_target" "efs" {
  count = var.enable_efs ? 1 : 0
  file_system_id  = "${aws_efs_file_system.efs[0].id}"
  subnet_id       = "${var.subnet}"
  security_groups = "${var.security_groups}"
}
