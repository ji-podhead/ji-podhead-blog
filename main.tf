

#resource "github_repository" "my_website2" {
#  name        = "my-static-website2"
#  description = "My static website hosted on GitHub Pages"
#  homepage_url = "https://ji-podhead.github.io/ji-podhead-blog"
#}
# resource "github_repository_file" "upload_index_html" {
#  repository = "ji-podhead/ji-podhead-blog" # Korrigiertes Format: Organisation/Repository
#  branch     = "main"
#  file   = "index.html"
#  content    = file("${path.module}/build/index.html")
#  commit_message = "Upload index.html"
#}
## push with SSH key
#resource "git_push" "remote" {
#  directory = "/path/to/git/repository"
#  refspecs  = ["refs/heads/master:refs/heads/master"]
#
#  auth = {
#    ssh_key = {
#      private_key_path = pathexpand("~/.ssh/id_rsa")
#    }
#  }
#}
## Optional: Add this if you want to upload the entire build directory recursively
#resource "null_resource" "upload_build_directory_recursive" {

#  provisioner "local-exec" {
#    command = <<-EOT
#      rsync -av --delete ${path.module}/build/ ${github_repository.my_website.clone_url}/build/
#    EOT

#  }
#}