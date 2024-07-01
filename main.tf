variable "github_token" {
  type        = string
  description = "The GitHub Personal Access Token"
  sensitive   = true
}


provider "github" {
  token = var.github_token
}

resource "github_repository" "my_website" {
  name        = "my-static-website"
  description = "My static website hosted on GitHub Pages"
  homepage_url = "https://ji-podhead.github.io/ji-podhead-blog"
}

   

## Optional: Add this if you want to upload the entire build directory recursively
#resource "null_resource" "upload_build_directory_recursive" {

#  provisioner "local-exec" {
#    command = <<-EOT
#      rsync -av --delete ${path.module}/build/ ${github_repository.my_website.clone_url}/build/
#    EOT

#  }
#}
resource "github_repository_file" "upload_index_html" {
  repository = "ji-podhead/ji-podhead-blog" # Korrigiertes Format: Organisation/Repository
  branch     = "main"
  filen   = "index.html"
  content    = file("${path.module}/build/index.html")
  commit_message = "Upload index.html"
}
